#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:-${ROOT}/MIGRATION_DASHBOARD.md}"
OWNER="${OWNER:-t81dev}"
VM_DIR="${T81_VM_DIR:-${ROOT}/../t81-vm}"

CONTRACT_FILE="${VM_DIR}/docs/contracts/vm-compatibility.json"
PARITY_FILE="${VM_DIR}/docs/parity-backlog.md"

for bin in jq curl; do
  if ! command -v "${bin}" >/dev/null 2>&1; then
    echo "Missing required dependency: ${bin}" >&2
    exit 1
  fi
done

if [[ ! -f "${CONTRACT_FILE}" ]]; then
  echo "Missing contract file: ${CONTRACT_FILE}" >&2
  exit 1
fi
if [[ ! -f "${PARITY_FILE}" ]]; then
  echo "Missing parity backlog: ${PARITY_FILE}" >&2
  exit 1
fi

snapshot_date="$(date -u +"%Y-%m-%d")"
contract_version="$(jq -r '.contract_version' "${CONTRACT_FILE}")"
abi_version="$(jq -r '.host_abi.version' "${CONTRACT_FILE}")"
runtime_tag="runtime-contract-v$(awk -F. '{print $1 "." $2}' <<<"${abi_version}")"
vm_opcode_count="$(jq -r '.supported_opcodes | length' "${CONTRACT_FILE}")"

parity_opcode_line="$(grep -m1 '^- Opcode coverage:' "${PARITY_FILE}" || true)"
parity_test_line="$(grep -m1 '^- VM conformance tests' "${PARITY_FILE}" || true)"

if [[ -z "${parity_opcode_line}" || -z "${parity_test_line}" ]]; then
  echo "Could not parse parity metrics from ${PARITY_FILE}" >&2
  exit 1
fi

foundation_opcode_count="$(sed -E 's/.*vs `([0-9]+)`.*/\1/' <<<"${parity_opcode_line}")"
vm_test_count="$(sed -E 's/.*: `([0-9]+)` \(`t81-vm`\) vs.*/\1/' <<<"${parity_test_line}")"
foundation_test_count="$(sed -E 's/.*vs `([0-9]+)`.*/\1/' <<<"${parity_test_line}")"

api_get() {
  local url="$1"
  if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    curl -fsSL -H "Authorization: Bearer ${GITHUB_TOKEN}" -H "Accept: application/vnd.github+json" "${url}"
  else
    curl -fsSL -H "Accept: application/vnd.github+json" "${url}"
  fi
}

latest_workflow() {
  local repo="$1"
  local workflow_name="$2"
  local url="https://api.github.com/repos/${repo}/actions/runs?per_page=100"
  local data
  data="$(api_get "${url}")"

  jq -r --arg wf "${workflow_name}" '
    .workflow_runs
    | map(select(.name == $wf))
    | sort_by(.created_at)
    | reverse
    | .[0]
    | if . == null then
        "unknown||"
      else
        "\(.conclusion // "unknown")|\(.html_url // "")|\(.created_at // "")"
      end
  ' <<<"${data}"
}

repos=(
  "${OWNER}/t81-vm|ecosystem-contract"
  "${OWNER}/t81-lang|ci"
  "${OWNER}/t81-python|CI"
  "${OWNER}/t81-docs|Docs Validate"
)

rows=()
failing=()
for item in "${repos[@]}"; do
  repo="${item%%|*}"
  workflow="${item##*|}"
  rec="$(latest_workflow "${repo}" "${workflow}")"
  conclusion="${rec%%|*}"
  rest="${rec#*|}"
  run_url="${rest%%|*}"
  run_time="${rest##*|}"

  if [[ -z "${run_time}" ]]; then
    run_time="n/a"
  fi

  if [[ -n "${run_url}" ]]; then
    status_cell="[${conclusion}](${run_url})"
  else
    status_cell="${conclusion}"
  fi

  rows+=("| \`${repo}\` | \`${workflow}\` | ${status_cell} | ${run_time} |")

  if [[ "${conclusion}" == "failure" || "${conclusion}" == "cancelled" || "${conclusion}" == "timed_out" || "${conclusion}" == "action_required" || "${conclusion}" == "startup_failure" || "${conclusion}" == "stale" ]]; then
    failing+=("- \`${repo}\` / \`${workflow}\`: ${conclusion}")
  fi
done

{
  echo "# Ecosystem Migration Dashboard"
  echo
  echo "Snapshot date: ${snapshot_date}."
  echo
  echo "## Runtime Contract"
  echo
  echo "- Canonical owner: \`t81-vm\`"
  echo "- Contract file: \`t81-vm/docs/contracts/vm-compatibility.json\`"
  echo "- Contract version: \`${contract_version}\`"
  echo "- Contract tag baseline: \`${runtime_tag}\`"
  echo "- Supported opcode count: \`${vm_opcode_count}\`"
  echo
  echo "## VM Parity"
  echo
  echo "- Opcode coverage: \`${vm_opcode_count}\` (\`t81-vm\`) vs \`${foundation_opcode_count}\` (\`t81-foundation\`)"
  echo "- VM conformance tests: \`${vm_test_count}\` (\`t81-vm\`) vs \`${foundation_test_count}\` (\`t81-foundation\`)"
  echo "- Source of parity backlog: \`t81-vm/docs/parity-backlog.md\`"
  echo
  echo "## Cross-Repo Contract CI"
  echo
  echo "| Repo | Workflow | Latest Conclusion | Completed At (UTC) |"
  echo "| --- | --- | --- | --- |"
  printf '%s\n' "${rows[@]}"
  echo
  echo "## Failing Checks"
  echo
  if [[ "${#failing[@]}" -eq 0 ]]; then
    echo "- None."
  else
    printf '%s\n' "${failing[@]}"
  fi
  echo
  echo "## Update Rule"
  echo
  echo "- Regenerate this dashboard whenever \`t81-vm\` contract/parity docs or any cross-repo compatibility workflow changes."
} > "${OUT}"

echo "Wrote ${OUT}"
