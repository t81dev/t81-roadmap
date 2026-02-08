#!/usr/bin/env bash
set -euo pipefail

ROADMAP_REPO="${ROADMAP_REPO:-t81dev/t81-roadmap}"
FOUNDATION_DIR="${FOUNDATION_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../../t81-foundation" 2>/dev/null && pwd || true)}"
DRY_RUN="${DRY_RUN:-0}"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is required." >&2
  exit 1
fi

if [[ -z "${FOUNDATION_DIR}" || ! -d "${FOUNDATION_DIR}/.git" ]]; then
  echo "t81-foundation checkout not found: ${FOUNDATION_DIR}" >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  if [[ -z "${GH_TOKEN:-}" && -z "${GITHUB_TOKEN:-}" ]]; then
    echo "GitHub CLI is not authenticated. Run: gh auth login or set GH_TOKEN." >&2
    exit 1
  fi
fi

ensure_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  if [[ "${DRY_RUN}" == "1" ]]; then
    echo "DRY_RUN: would ensure label: ${name}"
    return
  fi

  gh label create "${name}" --repo "${ROADMAP_REPO}" --color "${color}" --description "${description}" --force >/dev/null
}

ensure_issue() {
  local title="$1"
  local body="$2"

  if gh issue list --repo "${ROADMAP_REPO}" --state all --search "in:title \"${title}\"" --json title --jq '.[].title' | rg -Fx "${title}" >/dev/null 2>&1; then
    echo "Issue exists: ${title}"
    return
  fi

  if [[ "${DRY_RUN}" == "1" ]]; then
    echo "DRY_RUN: would create issue: ${title}"
    return
  fi

  gh issue create \
    --repo "${ROADMAP_REPO}" \
    --title "${title}" \
    --label "roadmap" \
    --label "rfc-intake" \
    --label "phase-1" \
    --body "${body}" >/dev/null

  echo "Created issue: ${title}"
}

latest_change() {
  local pathspec="$1"
  git -C "${FOUNDATION_DIR}" log -1 --format='%H|%cs|%s' -- "${pathspec}" 2>/dev/null || true
}

ensure_label "roadmap" "0e8a16" "Roadmap and milestone tracking"
ensure_label "phase-1" "1d76db" "Phase 1 work"
ensure_label "rfc-intake" "5319e7" "Intake tracking for t81-foundation RFC/spec updates"

rfc_change="$(latest_change 'spec/rfcs')"
spec_change="$(latest_change 'spec/*.md')"

if [[ -z "${rfc_change}" && -z "${spec_change}" ]]; then
  echo "No foundation spec changes found."
  exit 0
fi

if [[ -n "${rfc_change}" ]]; then
  IFS='|' read -r sha date subject <<<"${rfc_change}"
  sha7="${sha:0:7}"
  title="RFC intake: t81-foundation/spec/rfcs update ${sha7}"
  body=$(cat <<EOF
Detected update in t81-foundation/spec/rfcs.

- Commit: ${sha}
- Date: ${date}
- Subject: ${subject}
- Source: https://github.com/t81dev/t81-foundation/commit/${sha}

Required fan-out:
- [ ] Review contract impact on t81-vm/docs/contracts/vm-compatibility.json and parity plan.
- [ ] Open/link follow-up issues in t81-vm, t81-lang, t81-python, and t81-docs when impacted.
- [ ] Update t81-roadmap/MIGRATION_DASHBOARD.md notes if compatibility status changes.
EOF
)
  ensure_issue "${title}" "${body}"
fi

if [[ -n "${spec_change}" ]]; then
  IFS='|' read -r sha date subject <<<"${spec_change}"
  sha7="${sha:0:7}"
  title="Spec intake: t81-foundation/spec/*.md update ${sha7}"
  body=$(cat <<EOF
Detected update in top-level foundation spec docs (spec/*.md).

- Commit: ${sha}
- Date: ${date}
- Subject: ${subject}
- Source: https://github.com/t81dev/t81-foundation/commit/${sha}

Required fan-out:
- [ ] Validate terminology/contract consistency in t81-docs and t81-roadmap.
- [ ] Confirm runtime/ABI compatibility notes remain accurate in t81-lang and t81-python.
- [ ] Open linked execution issues where implementation changes are required.
EOF
)
  ensure_issue "${title}" "${body}"
fi

echo "Foundation intake check completed."
