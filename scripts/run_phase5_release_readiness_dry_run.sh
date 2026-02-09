#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODE_ROOT="$(cd "${ROOT_DIR}/.." && pwd)"
DATE_UTC="$(date -u +%Y-%m-%d)"
TS_UTC="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
OUT_FILE="${ROOT_DIR}/releases/${DATE_UTC}-phase5-release-readiness-dry-run.md"

echo "[phase5-dry-run] running weekly ops refresh"
(cd "${ROOT_DIR}" && make ops-weekly)

echo "[phase5-dry-run] running runtime compatibility checks"
(cd "${CODE_ROOT}/t81-lang" && python3 scripts/check-vm-compat.py)
(cd "${CODE_ROOT}/t81-python" && python3 scripts/check-vm-contract.py)
(cd "${CODE_ROOT}/t81-docs" && python3 scripts/check-runtime-contract-sync.py)

echo "[phase5-dry-run] validating onboarding references"
(cd "${ROOT_DIR}" && python3 - <<'PY'
from pathlib import Path
refs = [
    "ROADMAP.md",
    "STATUS.md",
    "MIGRATION_STATUS.md",
    "REPOSITORIES.md",
    "ECOSYSTEM_RELEASE_MANIFEST.json",
    "MIGRATION_DASHBOARD.md",
    "MIGRATION_CHECKPOINTS.md",
]
missing = [ref for ref in refs if not Path(ref).exists()]
if missing:
    raise SystemExit(f"Missing onboarding references: {', '.join(missing)}")
print("onboarding_ref_check: ok")
PY
)

echo "[phase5-dry-run] evaluating phase evidence freshness"
(cd "${ROOT_DIR}" && python3 scripts/check_phase_evidence_freshness.py)

echo "[phase5-dry-run] updating quality-gate streak tracker"
if [[ -n "${GH_TOKEN:-${GITHUB_TOKEN:-}}" ]]; then
  (cd "${ROOT_DIR}" && python3 scripts/update_phase5_quality_gate_streak.py) || \
    echo "[phase5-dry-run] warning: unable to refresh streak tracker"
else
  echo "[phase5-dry-run] skipping streak tracker update (missing GH token)"
fi

manifest_tag="$(jq -r '.runtime_contract.tag' "${ROOT_DIR}/ECOSYSTEM_RELEASE_MANIFEST.json")"
manifest_version="$(jq -r '.runtime_contract.contract_version' "${ROOT_DIR}/ECOSYSTEM_RELEASE_MANIFEST.json")"
manifest_pin="$(jq -r '.runtime_contract.vm_main_pin' "${ROOT_DIR}/ECOSYSTEM_RELEASE_MANIFEST.json")"
manifest_generated="$(jq -r '.generated_at_utc' "${ROOT_DIR}/ECOSYSTEM_RELEASE_MANIFEST.json")"

echo "[phase5-dry-run] writing release record ${OUT_FILE}"
cat > "${OUT_FILE}" <<EOF
# Phase 5 Release-Readiness Dry Run

Date: ${DATE_UTC}
Type: automated operational dry run

## Scope

Validate weekly release-readiness mechanics end-to-end:

1. weekly roadmap ops refresh,
2. runtime compatibility contract checks,
3. onboarding path sanity checks,
4. dated release-cut record publication.

## Runtime Contract Baseline

- Runtime tag: \`${manifest_tag}\`
- Contract version: \`${manifest_version}\`
- VM pin: \`${manifest_pin}\`
- Manifest generated at: \`${manifest_generated}\`

## Executed Checks

1. \`make ops-weekly\`
2. \`t81-lang/scripts/check-vm-compat.py\`
3. \`t81-python/scripts/check-vm-contract.py\`
4. \`t81-docs/scripts/check-runtime-contract-sync.py\`
5. onboarding reference existence check (Stage 0/3/4 assets)
6. phase evidence freshness check (\`PHASE_EVIDENCE_STATUS.md\`)

## Status Snapshot

- Dry-run completed at: \`${TS_UTC}\`
- Migration status board: \`MIGRATION_STATUS.md\`
- Blocker map: \`MIGRATION_BLOCKERS.json\`

## Follow-through

1. Keep this workflow scheduled weekly.
2. Treat any non-green migration status as a release blocker.
3. Keep publishing one dry-run record per run under \`releases/\`.
EOF

echo "[phase5-dry-run] complete"
