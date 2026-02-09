# Phase 6 Development Matrix

Tracker: https://github.com/t81dev/t81-roadmap/issues/18

Snapshot date: 2026-02-09.

## Goal

Convert migration-complete governance into a sustained development loop:
predictable contract upgrades, consumer integration adoption, and release quality
gates that prevent drift.

## Workstreams

| Workstream | Repo | Objective | Acceptance Check | Implementation Issue |
| --- | --- | --- | --- | --- |
| P6-D1 | `t81-vm`, `t81-lang`, `t81-python` | Establish runtime contract promotion cadence with explicit compatibility window policy | Policy in `docs/runtime-promotion-policy.md` published with one full promotion rehearsal recorded | https://github.com/t81dev/t81-roadmap/issues/19 |
| P6-D2 | `t81-examples`, `t81-docs` | Keep a canonical consumer onboarding path current with active runtime contract baseline | `runtime-v0.5` end-to-end example + docs path validated in CI and referenced in onboarding docs | https://github.com/t81dev/t81-roadmap/issues/20 |
| P6-D3 | `t81-roadmap`, `t81-benchmarks` | Turn release-readiness dry runs into periodic release candidate quality gates | Weekly dry runs remain green for 4 consecutive cycles tracked in `docs/phase5-quality-gate-streak.md` with release artifact history in `releases/` | https://github.com/t81dev/t81-roadmap/issues/21 |
| P6-D4 | `trinity`, `trinity-decrypt`, `trinity-pow` | Move security-domain repos from migration-aligned to iteration-ready | Per-repo quarterly objective docs committed with reproducible benchmark/evaluation hooks | https://github.com/t81dev/t81-roadmap/issues/22 |

## Exit Criteria

1. All P6 workstreams have explicit owner commits and evidence links in `STATUS.md`.
2. Runtime contract promotion from `v0.5` to next tag is executed with zero unsynchronized downstream markers.
3. Consumer onboarding path runs green in CI and in a local cold-start flow.
4. Phase evidence and release-readiness automation remain healthy for one month.
