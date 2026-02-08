# Runtime Sync Report

Snapshot date: 2026-02-08.
Snapshot time (UTC): 2026-02-08T21:44:38Z.

## VM Baseline

- Repository: `t81-vm`
- Commit pin: `16b352b`
- Contract version: `2026-02-08-v4`
- ABI version: `0.1.0`
- Parity evidence artifact: `build/mode-parity/parity-evidence.json`
- Supported opcode count: `81`

## Health Summary

- Overall status: `pass`

## Check Results

| Check | Status |
| --- | --- |
| t81-vm make check | pass |
| t81-vm parity evidence artifact | pass |
| t81-vm ecosystem canary | pass |
| t81-lang runtime compatibility | pass |
| t81-lang compiler/runtime roundtrip | pass |
| t81-python VM contract gate | pass |

## Update Rule

- Regenerated weekly by `.github/workflows/runtime-sync-report.yml`.
- If overall status is `fail`, triage before updating downstream VM pin references.
