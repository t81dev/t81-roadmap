#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-t81dev/t81-roadmap}"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is required." >&2
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "Not authenticated. Run: gh auth login" >&2
  exit 1
fi

ensure_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  if gh label list --repo "$REPO" --search "$name" --json name --jq '.[].name' | rg -Fx "$name" >/dev/null 2>&1; then
    echo "Label exists: $name"
    return
  fi

  gh label create "$name" --repo "$REPO" --color "$color" --description "$description" >/dev/null
  echo "Created label: $name"
}

ensure_milestone() {
  local title="$1"
  local description="$2"

  if gh api "repos/${REPO}/milestones?state=all&per_page=100" --jq '.[].title' | rg -Fx "$title" >/dev/null 2>&1; then
    echo "Milestone exists: $title"
    return
  fi

  gh api "repos/${REPO}/milestones" -X POST -f title="$title" -f description="$description" >/dev/null
  echo "Created milestone: $title"
}

ensure_issue() {
  local title="$1"
  local milestone="$2"
  local label_csv="$3"
  local body="$4"

  if gh issue list --repo "$REPO" --state all --search "in:title \"${title}\"" --json title --jq '.[].title' | rg -Fx "$title" >/dev/null 2>&1; then
    echo "Issue exists: $title"
    return
  fi

  IFS=',' read -r -a labels <<< "$label_csv"
  local args=()
  for label in "${labels[@]}"; do
    args+=(--label "$label")
  done

  gh issue create \
    --repo "$REPO" \
    --title "$title" \
    --milestone "$milestone" \
    --body "$body" \
    "${args[@]}" >/dev/null

  echo "Created issue: $title"
}

ensure_label "roadmap" "0e8a16" "Roadmap and milestone tracking"
ensure_label "phase-0" "1d76db" "Phase 0 work"
ensure_label "phase-1" "1d76db" "Phase 1 work"
ensure_label "phase-2" "1d76db" "Phase 2 work"
ensure_label "phase-3" "1d76db" "Phase 3 work"
ensure_label "phase-4" "1d76db" "Phase 4 work"
ensure_label "phase-5" "1d76db" "Phase 5 work"

ensure_milestone "P0 - Alignment and Baselines" "Terminology, constraints, and benchmark protocol alignment."
ensure_milestone "P1 - Core Stack Stabilization" "Runtime semantics, quantization core, ABI, Python surface."
ensure_milestone "P2 - Tooling and Developer Experience" "Examples, docs UX, debug workflows, migration guides."
ensure_milestone "P3 - Hardware and Systems Prototyping" "Simulation milestones and hardware-software co-design checkpoints."
ensure_milestone "P4 - Security and Applied Domains" "Evaluation plan and threat-model framing for crypto experiments."
ensure_milestone "P5 - Public Release Readiness" "Release criteria, compatibility matrix, contributor onboarding path."

ensure_issue \
  "P0 kickoff: alignment and baseline checklist" \
  "P0 - Alignment and Baselines" \
  "roadmap,phase-0" \
  "Track and close all Phase 0 checklist items from ROADMAP.md.\n\nDefinition of done:\n- Terminology frozen across specs/docs\n- Benchmark protocol published\n- Constraint register published"

ensure_issue \
  "P1 kickoff: core stack stabilization checklist" \
  "P1 - Core Stack Stabilization" \
  "roadmap,phase-1" \
  "Track and close all Phase 1 checklist items from ROADMAP.md.\n\nDefinition of done:\n- Runtime semantics locked\n- Quantization primitives hardened\n- GCC plugin ABI validated\n- Python surface documented"

ensure_issue \
  "P2 kickoff: tooling and DX checklist" \
  "P2 - Tooling and Developer Experience" \
  "roadmap,phase-2" \
  "Track and close all Phase 2 checklist items from ROADMAP.md.\n\nDefinition of done:\n- End-to-end examples expanded\n- Docs navigation unified\n- Inspector/debug workflows documented\n- Migration guides published"

ensure_issue \
  "P3 kickoff: hardware and systems checklist" \
  "P3 - Hardware and Systems Prototyping" \
  "roadmap,phase-3" \
  "Track and close all Phase 3 checklist items from ROADMAP.md.\n\nDefinition of done:\n- Simulation milestones defined\n- Fabric/memory experiments linked\n- Co-design checkpoints documented"

ensure_issue \
  "P4 kickoff: security and applied domains checklist" \
  "P4 - Security and Applied Domains" \
  "roadmap,phase-4" \
  "Track and close all Phase 4 checklist items from ROADMAP.md.\n\nDefinition of done:\n- Evaluation plan formalized\n- Benchmark alignment documented\n- Threat-model notes added"

ensure_issue \
  "P5 kickoff: release readiness checklist" \
  "P5 - Public Release Readiness" \
  "roadmap,phase-5" \
  "Track and close all Phase 5 checklist items from ROADMAP.md.\n\nDefinition of done:\n- Tiered release criteria published\n- Compatibility matrix published\n- Contributor path documented"

echo "Milestones and seed issues are in place for ${REPO}."
