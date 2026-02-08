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
| Runtime and Quantization | `t81lib`, `ternary`, `t81-python`, `ternary_gcc_plugin` | `@t81dev` | `TBD` |
| Tooling and Docs | `t81-docs`, `t81-examples`, `ternary-tools`, `t81-roadmap` | `@t81dev` | `TBD` |
| Hardware and Systems | `t81-hardware`, `ternary-fabric`, `ternary-memory-research` | `@t81dev` | `TBD` |
| Crypto Experiments | `trinity`, `trinity-decrypt`, `trinity-pow` | `@t81dev` | `TBD` |

## Current Focus Areas

- Documentation and onboarding consistency.
- Benchmark reproducibility and publication hygiene.
- Spec/runtime boundary clarity.
- Hardware simulation path definition.

## Tracking Template

Use this section for recurring updates.

### YYYY-MM-DD

- Scope:
- Repos touched:
- Risks discovered:
- Evidence added:
- Maturity movement:
- Next actions:

## Pending Coordination Items

- Fill backup owners in owner map.
- Publish compatibility matrix in `ROADMAP.md` Phase 5.
