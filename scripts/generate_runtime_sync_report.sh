#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:-${ROOT}/RUNTIME_SYNC_REPORT.md}"
VM_DIR="${T81_VM_DIR:-${ROOT}/../t81-vm}"
LANG_DIR="${T81_LANG_DIR:-${ROOT}/../t81-lang}"
PY_DIR="${T81_PYTHON_DIR:-${ROOT}/../t81-python}"

for req in "${VM_DIR}" "${LANG_DIR}" "${PY_DIR}"; do
  if [[ ! -d "${req}" ]]; then
    echo "Missing required repo path: ${req}" >&2
    exit 1
  fi
done

snapshot_date="$(date -u +"%Y-%m-%d")"
snapshot_time="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
vm_pin="$(git -C "${VM_DIR}" rev-parse --short HEAD)"

read_contract_field() {
  local expr="$1"
  python3 - <<'PY' "${VM_DIR}" "${expr}"
import json
import sys
from pathlib import Path
vm_dir = Path(sys.argv[1])
expr = sys.argv[2]
data = json.loads((vm_dir / "docs/contracts/vm-compatibility.json").read_text(encoding="utf-8"))
if expr == "contract_version":
    print(data.get("contract_version", "unknown"))
elif expr == "opcode_count":
    print(len(data.get("supported_opcodes", [])))
elif expr == "abi_version":
    print(data.get("host_abi", {}).get("version", "unknown"))
elif expr == "parity_artifact_path":
    print(data.get("execution_mode_parity_evidence", {}).get("artifact_path", "unknown"))
else:
    print("unknown")
PY
}

contract_version="$(read_contract_field contract_version)"
opcode_count="$(read_contract_field opcode_count)"
abi_version="$(read_contract_field abi_version)"
parity_artifact_path="$(read_contract_field parity_artifact_path)"

declare -a rows=()
failures=0

run_check() {
  local name="$1"
  shift
  if "$@" >/tmp/runtime-sync-check.log 2>&1; then
    rows+=("| ${name} | pass |")
  else
    rows+=("| ${name} | fail |")
    failures=1
  fi
}

run_check "t81-vm make check" make -C "${VM_DIR}" check
run_check "t81-vm parity evidence artifact" test -f "${VM_DIR}/${parity_artifact_path}"
run_check "t81-vm ecosystem canary" make -C "${VM_DIR}" canary-check
run_check "t81-lang runtime compatibility" env T81_VM_DIR="${VM_DIR}" python3 "${LANG_DIR}/scripts/check-vm-compat.py"
run_check "t81-lang compiler/runtime roundtrip" env T81_VM_DIR="${VM_DIR}" bash "${LANG_DIR}/scripts/check-compiler-roundtrip.sh"
run_check "t81-python VM contract gate" env T81_VM_DIR="${VM_DIR}" python3 "${PY_DIR}/scripts/check-vm-contract.py"

overall="pass"
if [[ "${failures}" -eq 1 ]]; then
  overall="fail"
fi

{
  echo "# Runtime Sync Report"
  echo
  echo "Snapshot date: ${snapshot_date}."
  echo "Snapshot time (UTC): ${snapshot_time}."
  echo
  echo "## VM Baseline"
  echo
  echo "- Repository: \`t81-vm\`"
  echo "- Commit pin: \`${vm_pin}\`"
  echo "- Contract version: \`${contract_version}\`"
  echo "- ABI version: \`${abi_version}\`"
  echo "- Parity evidence artifact: \`${parity_artifact_path}\`"
  echo "- Supported opcode count: \`${opcode_count}\`"
  echo
  echo "## Health Summary"
  echo
  echo "- Overall status: \`${overall}\`"
  echo
  echo "## Check Results"
  echo
  echo "| Check | Status |"
  echo "| --- | --- |"
  printf '%s\n' "${rows[@]}"
  echo
  echo "## Update Rule"
  echo
  echo "- Regenerated weekly by \`.github/workflows/runtime-sync-report.yml\`."
  echo "- If overall status is \`fail\`, triage before updating downstream VM pin references."
} > "${OUT}"

echo "Wrote ${OUT}"
