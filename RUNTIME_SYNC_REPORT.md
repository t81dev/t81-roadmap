# Runtime Sync Report

Snapshot date: 2026-02-16.
Snapshot time (UTC): 2026-02-16T09:59:04Z.

## VM Baseline

- Repository: `t81-vm`
- Commit pin: `4e2bba639d05249722db847563ae37991289ea52`
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
