# t81-roadmap

Public roadmap and coordination hub for the `t81dev` ecosystem.

Snapshot date: February 8, 2026.

## Purpose

This repository is the canonical place to:

- Track cross-repo milestones.
- Explain the big-picture sequence from research to production.
- Show contributors where work is needed now.
- Keep scope and constraints aligned across projects.

## Start Here

- Roadmap: `ROADMAP.md`
- Phase 3 Milestone Matrix: `PHASE3_MILESTONE_MATRIX.md`
- Repository Catalog: `REPOSITORIES.md`
- Current Status Board: `STATUS.md`
- Migration Dashboard: `MIGRATION_DASHBOARD.md`
- Migration Status Board: `MIGRATION_STATUS.md`
- Migration Blocker Map: `MIGRATION_BLOCKERS.json`
- Runtime Sync Report: `RUNTIME_SYNC_REPORT.md`
- Migration Checkpoints: `MIGRATION_CHECKPOINTS.md`
- Ecosystem Release Manifest: `ECOSYSTEM_RELEASE_MANIFEST.json`
- Contribution Process: `CONTRIBUTING.md`

## Automation

- Refresh catalog locally: `scripts/sync_repositories.sh t81dev REPOSITORIES.md`
- Seed milestones/issues (after `gh auth login`): `scripts/bootstrap_milestones_and_issues.sh t81dev/t81-roadmap`
- Regenerate migration dashboard: `scripts/generate_migration_dashboard.sh MIGRATION_DASHBOARD.md`
- Regenerate runtime sync report: `scripts/generate_runtime_sync_report.sh RUNTIME_SYNC_REPORT.md`
- Regenerate release manifest: `python3 scripts/generate_ecosystem_release_manifest.py`
- Regenerate migration status board: `python3 scripts/generate_migration_status.py`
- Sync migration blockers: `python3 scripts/sync_migration_blockers.py`
- Run foundation spec/RFC intake: `scripts/intake_foundation_spec_changes.sh`
- Scheduled catalog sync workflow: `.github/workflows/sync-repositories.yml`
- Scheduled dashboard refresh workflow: `.github/workflows/update-migration-dashboard.yml`
- Scheduled runtime sync workflow: `.github/workflows/runtime-sync-report.yml`
- Scheduled foundation intake workflow: `.github/workflows/foundation-rfc-intake.yml`
- Scheduled release manifest workflow: `.github/workflows/release-manifest.yml`
- Scheduled migration status workflow: `.github/workflows/migration-status.yml`
- Weekly release cut records: `releases/*.md`

## Ecosystem Structure

The ecosystem currently spans these domains:

- Core runtime and language foundation.
- Quantization and model tooling.
- Hardware and systems simulation.
- Cryptography and security experiments.
- Documentation, examples, and benchmark evidence.

See `REPOSITORIES.md` for full per-repo mapping.

## Governance Goals

- Keep normative specifications distinct from interpretive documents.
- Ensure benchmarks are reproducible before claims are promoted.
- Prefer deterministic interfaces between research layers.
- Make migration paths from binary systems explicit.

## Near-Term Outcomes

- Unify docs and onboarding flow (`t81-docs`, `t81-examples`, `t81-roadmap`).
- Stabilize core specs and constraints (`t81-foundation`, `t81-constraints`, `duotronic-whitepaper`).
- Publish repeatable benchmark baselines (`t81-benchmarks`, `t81lib`, `ternary`).

## Scope Note

This repo tracks strategy and progress. Implementation work stays in the relevant project repositories.
