# Roadmap

Snapshot date: February 8, 2026.

## Execution Cadence

- Strategy review: monthly.
- Status updates: weekly in `STATUS.md`.
- Milestone check-in: at least once per phase each month.

## Phase Ownership

- Phase 0-1 steward: `@t81dev` (spec/runtime).
- Phase 2 steward: `@t81dev` (tooling/docs).
- Phase 3 steward: `@t81dev` (hardware/systems).
- Phase 4 steward: `@t81dev` (crypto/security experiments).
- Phase 5 steward: `@t81dev` (release and ecosystem coordination).

## GitHub Milestones

- `P0 - Alignment and Baselines`
- `P1 - Core Stack Stabilization`
- `P2 - Tooling and Developer Experience`
- `P3 - Hardware and Systems Prototyping`
- `P4 - Security and Applied Domains`
- `P5 - Public Release Readiness`

## Phase 0: Alignment and Baselines

Owner cluster: `t81-foundation`, `duotronic-whitepaper`, `t81-docs`, `t81-constraints`, `t81-benchmarks`
Milestone matrix: `PHASE0_ALIGNMENT_MATRIX.md`

- [ ] Freeze terminology across `t81-foundation`, `duotronic-whitepaper`, and `t81-docs`.
- [ ] Define a single source of truth for formal vs interpretive docs.
- [x] Establish reproducible benchmark protocol in `t81-benchmarks`.
- [x] Establish monthly benchmark publication cadence in `t81-benchmarks` (tracker: `#17`).
- [ ] Publish ecosystem constraint register in `t81-constraints`.

## Phase 1: Core Stack Stabilization

Owner cluster: `t81-foundation`, `t81-vm`, `t81lib`, `t81-python`, `ternary_gcc_plugin`
Milestone matrix: `PHASE1_STABILIZATION_MATRIX.md`

- [ ] Lock core runtime semantics in `t81-foundation`.
- [x] Lock executable VM contract and trap/opcode registry in `t81-vm`.
- [ ] Harden arithmetic and quantization primitives in `t81lib`.
- [ ] Validate GCC plugin ABI contract in `ternary_gcc_plugin`.
- [x] Document and verify `t81-python` bridge to `t81-vm` host ABI.

## Phase 2: Tooling and Developer Experience

Owner cluster: `t81-docs`, `t81-examples`, `ternary-tools`, `ternary-pager`

- [x] Expand end-to-end samples in `t81-examples` (tracker: `#15`).
- [x] Build unified docs navigation in `t81-docs` (tracker: `#15`).
- [x] Add inspection/debug workflows via `ternary-tools` and `ternary-pager` (tracker: `#15`).
- [x] Publish migration guides from binary-first systems.

## Phase 3: Hardware and Systems Prototyping

Owner cluster: `t81-hardware`, `ternary-fabric`, `ternary-memory-research`
Milestone matrix: `PHASE3_MILESTONE_MATRIX.md`

- [x] Define simulation milestones in `t81-hardware` (tracker: `#16`).
- [x] Connect memory/interconnect experiments from `ternary-fabric` (tracker: `#16`).
- [x] Validate memory hypotheses in `ternary-memory-research` (tracker: `#16`).
- [x] Specify software-hardware co-design checkpoints (tracker: `#16`).

## Phase 4: Security and Applied Domains

Owner cluster: `trinity`, `trinity-decrypt`, `trinity-pow`, `t81-benchmarks`
Milestone matrix: `PHASE4_SECURITY_MATRIX.md`

- [x] Formalize evaluation plan for `trinity` suite projects.
- [x] Align crypto experiments with benchmark framework.
- [x] Add threat-model notes and limits to docs.

## Phase 5: Public Release Readiness

Owner cluster: `t81-roadmap`, `t81-docs`, `t81-examples`, `t81-python`

- [x] Create release criteria by maturity tier (research, preview, stable).
- [x] Publish cross-repo compatibility matrix and machine-readable runtime contract versions.
- [x] Keep `MIGRATION_DASHBOARD.md` refreshed from CI automation (`update-migration-dashboard.yml`).
- [x] Track next runtime contract promotion in a cross-repo issue (`#14`).
- [x] Publish contributor onboarding path from first issue to advanced work.

## Milestone Rules

- A milestone is complete only when docs and tests are updated in the target repo.
- Cross-repo changes require linked issues in all affected repos.
- Claims about performance require reproducible benchmark artifacts.
- Promotion between phases requires meeting the tier criteria in `STATUS.md`.
- VM/runtime contract changes require a version/tag bump in `t81-vm` and synchronized compatibility updates in `t81-lang` and `t81-python`.
- Each cross-repo runtime sync checkpoint must be logged in `MIGRATION_CHECKPOINTS.md` with commit pins and CI evidence links.
- `t81-foundation/spec` updates require intake issues via `foundation-rfc-intake.yml` with linked follow-up tasks in affected repos.
