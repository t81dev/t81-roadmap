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

- [ ] Freeze terminology across `t81-foundation`, `duotronic-whitepaper`, and `t81-docs`.
- [ ] Define a single source of truth for formal vs interpretive docs.
- [ ] Establish reproducible benchmark protocol in `t81-benchmarks`.
- [ ] Publish ecosystem constraint register in `t81-constraints`.

## Phase 1: Core Stack Stabilization

Owner cluster: `t81-foundation`, `t81-vm`, `t81lib`, `t81-python`, `ternary_gcc_plugin`

- [ ] Lock core runtime semantics in `t81-foundation`.
- [ ] Lock executable VM contract and trap/opcode registry in `t81-vm`.
- [ ] Harden arithmetic and quantization primitives in `t81lib`.
- [ ] Validate GCC plugin ABI contract in `ternary_gcc_plugin`.
- [ ] Document and verify `t81-python` bridge to `t81-vm` host ABI.

## Phase 2: Tooling and Developer Experience

Owner cluster: `t81-docs`, `t81-examples`, `ternary-tools`, `ternary-pager`

- [ ] Expand end-to-end samples in `t81-examples`.
- [ ] Build unified docs navigation in `t81-docs`.
- [ ] Add inspection/debug workflows via `ternary-tools` and `ternary-pager`.
- [ ] Publish migration guides from binary-first systems.

## Phase 3: Hardware and Systems Prototyping

Owner cluster: `t81-hardware`, `ternary-fabric`, `ternary-memory-research`

- [ ] Define simulation milestones in `t81-hardware`.
- [ ] Connect memory/interconnect experiments from `ternary-fabric`.
- [ ] Validate memory hypotheses in `ternary-memory-research`.
- [ ] Specify software-hardware co-design checkpoints.

## Phase 4: Security and Applied Domains

Owner cluster: `trinity`, `trinity-decrypt`, `trinity-pow`, `t81-benchmarks`

- [ ] Formalize evaluation plan for `trinity` suite projects.
- [ ] Align crypto experiments with benchmark framework.
- [ ] Add threat-model notes and limits to docs.

## Phase 5: Public Release Readiness

Owner cluster: `t81-roadmap`, `t81-docs`, `t81-examples`, `t81-python`

- [ ] Create release criteria by maturity tier (research, preview, stable).
- [ ] Publish cross-repo compatibility matrix and machine-readable runtime contract versions.
- [ ] Publish contributor onboarding path from first issue to advanced work.

## Milestone Rules

- A milestone is complete only when docs and tests are updated in the target repo.
- Cross-repo changes require linked issues in all affected repos.
- Claims about performance require reproducible benchmark artifacts.
- Promotion between phases requires meeting the tier criteria in `STATUS.md`.
- VM/runtime contract changes require a version/tag bump in `t81-vm` and synchronized compatibility updates in `t81-lang` and `t81-python`.
