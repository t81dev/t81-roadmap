# Runtime Golden Demo Artifact

Date: `YYYY-MM-DD`
Type: cross-repo deterministic consumer demonstration

## Runtime Baseline

- Runtime tag: `{{RUNTIME_TAG}}`
- Contract version: `{{CONTRACT_VERSION}}`
- VM contract pin: `{{VM_PIN}}`
- Manifest generated at: `{{MANIFEST_GENERATED_AT}}`

## Repo Pins

- `t81-lang`: `{{PIN_T81_LANG}}`
- `t81-python`: `{{PIN_T81_PYTHON}}`
- `t81-examples`: `{{PIN_T81_EXAMPLES}}`
- `t81-foundation`: `{{PIN_T81_FOUNDATION}}`

## Execution Paths

1. `scripts/run-runtime-v0.5-e2e.sh`
2. `scripts/run-runtime-v0.5-trap-diagnostics.sh`
3. `scripts/run-runtime-v0.5-mode-parity.sh`

## Evidence

- Consumer suite CI: `{{EXAMPLES_RUNTIME_SUITE_RUN_URL}}`
- Phase5 quality-gate run: `{{ROADMAP_PHASE5_RUN_URL}}`
- Optional local state hash evidence: `{{LOCAL_HASH_OR_NA}}`

## Purpose

Recurring golden demo snapshot for externally shareable deterministic execution
evidence tied to active runtime contract pins.
