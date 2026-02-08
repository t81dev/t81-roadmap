# Contributing

## Contribution Priorities

Use this order when choosing work:

1. Fix correctness/spec mismatches.
2. Improve reproducibility and benchmarks.
3. Improve onboarding and docs quality.
4. Expand experimental features.

## Workflow

1. Open or link an issue in the target implementation repo.
2. If cross-repo impact exists, open tracking issue in `t81-roadmap`.
3. Submit PR with clear scope, assumptions, and validation steps.
4. Update docs/checklists in affected repos before merge.

Contributor growth path:
- `CONTRIBUTOR_ONBOARDING_PATH.md`

## Roadmap Automation

1. Authenticate GitHub CLI once: `gh auth login`
2. Seed roadmap milestones/issues: `scripts/bootstrap_milestones_and_issues.sh t81dev/t81-roadmap`
3. Refresh repository catalog manually when needed: `scripts/sync_repositories.sh t81dev REPOSITORIES.md`

## PR Checklist

- [ ] Problem statement is explicit.
- [ ] Scope is bounded and testable.
- [ ] Constraints and risks are documented.
- [ ] Benchmarks are reproducible (if performance claims are made).
- [ ] Roadmap/milestones are updated when status changes.

## Issue Labels (Recommended)

- `spec`
- `benchmarks`
- `docs`
- `runtime`
- `hardware`
- `crypto`
- `research`
- `good-first-issue`

## Definition of Done

A task is done when implementation, docs, and validation evidence are all present.
