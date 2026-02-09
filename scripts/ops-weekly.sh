#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OWNER="${1:-t81dev}"

echo "[ops-weekly] syncing repository catalog for owner: ${OWNER}"
"${ROOT_DIR}/scripts/sync_repositories.sh" "${OWNER}" "${ROOT_DIR}/REPOSITORIES.md"

echo "[ops-weekly] regenerating migration dashboard"
"${ROOT_DIR}/scripts/generate_migration_dashboard.sh" "${ROOT_DIR}/MIGRATION_DASHBOARD.md"

echo "[ops-weekly] regenerating runtime sync report"
"${ROOT_DIR}/scripts/generate_runtime_sync_report.sh" "${ROOT_DIR}/RUNTIME_SYNC_REPORT.md"

echo "[ops-weekly] regenerating ecosystem release manifest"
python3 "${ROOT_DIR}/scripts/generate_ecosystem_release_manifest.py"

echo "[ops-weekly] regenerating migration status board"
python3 "${ROOT_DIR}/scripts/generate_migration_status.py"

echo "[ops-weekly] syncing migration blockers"
python3 "${ROOT_DIR}/scripts/sync_migration_blockers.py"

echo "[ops-weekly] evaluating phase evidence freshness"
python3 "${ROOT_DIR}/scripts/check_phase_evidence_freshness.py"

echo "[ops-weekly] complete"
