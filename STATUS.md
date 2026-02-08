# Status Board

Snapshot date: February 8, 2026.

## Maturity Tiers

- Tier 0: Concept
- Tier 1: Prototype
- Tier 2: Reproducible
- Tier 3: Integration-Ready
- Tier 4: Stable

## Promotion Criteria

### Tier 0 -> Tier 1

- Public problem statement exists.
- Initial implementation artifact exists in target repo.
- Constraints and assumptions are documented.

### Tier 1 -> Tier 2

- Reproducible run instructions are committed.
- Validation artifact exists (test report or benchmark output).
- At least one independent rerun is documented.

### Tier 2 -> Tier 3

- Interfaces are documented and versioned.
- At least one downstream integration is verified.
- Known failure modes are documented.

### Tier 3 -> Tier 4

- Release checklist and compatibility matrix are published.
- Regression tests are automated in CI.
- Operational runbook and support policy are documented.

## Owner Map

| Cluster | Primary Repos | Steward | Backup |
| --- | --- | --- | --- |
| Specs and Constraints | `t81-foundation`, `duotronic-whitepaper`, `t81-constraints` | `@t81dev` | `TBD` |
| Runtime and Quantization | `t81-vm`, `t81lib`, `ternary`, `t81-python`, `ternary_gcc_plugin` | `@t81dev` | `TBD` |
| Tooling and Docs | `t81-docs`, `t81-examples`, `ternary-tools`, `t81-roadmap` | `@t81dev` | `TBD` |
| Hardware and Systems | `t81-hardware`, `ternary-fabric`, `ternary-memory-research` | `@t81dev` | `TBD` |
| Crypto Experiments | `trinity`, `trinity-decrypt`, `trinity-pow` | `@t81dev` | `TBD` |

## Current Focus Areas

- Documentation and onboarding consistency.
- Benchmark reproducibility and publication hygiene.
- Spec/runtime boundary clarity (`t81-foundation` -> `t81-vm` execution contract split).
- Hardware simulation path definition.
- Runtime contract drift prevention via `MIGRATION_STATUS.md` and release-manifest cadence.

## Tracking Template

Use this section for recurring updates.

### 2026-02-08

- Scope: Migration contract gates, CI stabilization, and intake fan-out operationalization.
- Repos touched: `t81-vm`, `t81-lang`, `t81-python`, `t81-docs`, `t81-roadmap`.
- Risks discovered: parity risk retired; remaining risk concentrated in contract/version drift across downstream repos.
- Evidence added: green contract CI checks across core repos, active `runtime-contract-v0.2` baseline, and refreshed `MIGRATION_DASHBOARD.md`.
- Maturity movement: cross-repo contract governance moved from ad hoc updates to enforced automation.
- Next actions: sustain pinned/floating lane discipline and expand Phase 3 reproducible benchmark publication.

### 2026-02-08 (Parity Closeout)

- Scope: Runtime parity closeout and cross-repo contract synchronization.
- Repos touched: `t81-vm`, `t81-lang`, `t81-python`, `t81-docs`, `t81-roadmap`, `t81-foundation`.
- Risks discovered: primary parity risk is closed; remaining risk moved to ABI/version governance drift.
- Evidence added: `t81-vm` parity commits `23a1003` (opcode/test parity) and `8df1c47` (`.gitignore` hygiene), canary and compatibility gates passing.
- Maturity movement: VM migration moved from partial parity to full opcode/test parity (`81/81`, `13/13`).
- Next actions: pin baseline in downstream docs and maintain compatibility matrix discipline on every runtime contract change.

## Pending Coordination Items

- Fill backup owners in owner map.
- Keep `MIGRATION_DASHBOARD.md` current and review failing cross-repo CI conclusions weekly.
- Triage new `rfc-intake` issues generated from `t81-foundation/spec` changes.
- Execute runtime contract promotion tracker `#14` and close with linked cross-repo PRs.
- Keep `PHASE3_MILESTONE_MATRIX.md` linked issues moving and attach evidence artifacts as they land.
- Keep monthly publication bundles current in `t81-benchmarks/publications/`.
- Keep weekly ecosystem release-cut records current under `releases/`.
