# Runtime Promotion Policy

Snapshot date: 2026-02-09.

## Purpose

Define how runtime contract versions are promoted across the ecosystem without
downstream drift.

## Cadence

1. Promotion review window: weekly, aligned to Monday UTC release cadence.
2. Promotion execution: only after green checks in all required compatibility workflows.
3. Emergency hotfix promotion: allowed outside cadence, but must include the same evidence bundle.

## Compatibility Window

1. Active baseline: latest promoted runtime contract tag.
2. Grace window: one previous tag may remain accepted for one weekly cycle.
3. Enforcement: after grace window ends, all marker repos must reference active baseline.

## Required Evidence Before Promotion

1. `t81-vm` contract and parity checks green.
2. `t81-lang`, `t81-python`, `t81-docs`, `t81-examples` compatibility workflows green.
3. `ECOSYSTEM_RELEASE_MANIFEST.json`, `MIGRATION_DASHBOARD.md`, and `MIGRATION_STATUS.md` regenerated.
4. Promotion note committed under `releases/YYYY-MM-DD-runtime-contract-vX.Y-promotion.md`.

## Rollback Rule

1. Trigger rollback when any required compatibility workflow fails after promotion.
2. Re-pin marker repos to prior known-good runtime tag and VM pin.
3. Publish rollback record in `releases/` and log blocker in `MIGRATION_BLOCKERS.json`.

## Ownership

- Promotion coordinator: `t81-roadmap` steward.
- Canonical contract owner: `t81-vm`.
- Downstream marker owners: `t81-lang`, `t81-python`, `t81-docs`, `t81-examples`.
