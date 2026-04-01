# Runtime Golden Demo Artifact

Date: 2026-04-01
Type: cross-repo deterministic consumer demonstration

## Runtime Baseline

- Runtime tag: `runtime-contract-v0.5`
- Contract version: `2026-02-08-v5`
- VM contract pin: `4158a42156a085a2b722205be951576fc01969b9`
- Manifest generated at: `2026-04-01T09:21:28Z`

## Repo Pins

- `t81-lang`: `bcce8e729595df8fdcf92ad81c0c751fe0d928d6`
- `t81-python`: `3f576442ed6776a560c4a2daf3f505a31ff97ddf`
- `t81-examples`: `a972684f48747d04c6bbb6c358fa01708f528a24`
- `t81-foundation`: `d5db886629926fd11358c4e71ce3a37d7e333573`

## Execution Paths

1. `scripts/run-runtime-v0.5-e2e.sh`
2. `scripts/run-runtime-v0.5-trap-diagnostics.sh`
3. `scripts/run-runtime-v0.5-mode-parity.sh`

## Evidence

- Consumer suite CI: `https://github.com/t81dev/t81-examples/actions/runs/23732357425`
- Phase5 quality-gate run: `https://github.com/t81dev/t81-roadmap/actions/runs/23736551471`
- Optional local state hash evidence: `n/a`

## Purpose

Recurring golden demo snapshot for externally shareable deterministic execution
evidence tied to active runtime contract pins.
