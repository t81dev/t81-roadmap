# Runtime Sync Report

Snapshot date: 2026-02-08.
Snapshot time (UTC): 2026-02-08T19:23:18Z.

## VM Baseline

- Repository: `t81-vm`
- Commit pin: `85031ec`
- Contract version: `2026-02-08`
- ABI version: `0.1.0`
- Supported opcode count: `81`

## Health Summary

- Overall status: `pass`

## Check Results

| Check | Status |
| --- | --- |
| t81-vm make check | pass |
| t81-vm ecosystem canary | pass |
| t81-lang runtime compatibility | pass |
| t81-lang compiler/runtime roundtrip | pass |
| t81-python VM contract gate | pass |

## Update Rule

- Regenerated weekly by `.github/workflows/runtime-sync-report.yml`.
- If overall status is `fail`, triage before updating downstream VM pin references.
