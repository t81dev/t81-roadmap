# Runtime Sync Report

Snapshot date: 2026-02-09.
Snapshot time (UTC): 2026-02-09T00:55:21Z.

## VM Baseline

- Repository: `t81-vm`
- Commit pin: `e88cefb31ea50254fcb314436acce21dfdfa80c4`
- Contract version: `2026-02-08-v5`
- ABI version: `0.1.0`
- Parity evidence artifact: `build/mode-parity/parity-evidence.json`
- Supported opcode count: `81`

## Health Summary

- Overall status: `fail`

## Check Results

| Check | Status |
| --- | --- |
| t81-vm make check | pass |
| t81-vm parity evidence artifact | pass |
| t81-vm ecosystem canary | fail |
| t81-lang runtime compatibility | pass |
| t81-lang compiler/runtime roundtrip | pass |
| t81-python VM contract gate | pass |

## Update Rule

- Regenerated weekly by `.github/workflows/runtime-sync-report.yml`.
- If overall status is `fail`, triage before updating downstream VM pin references.
