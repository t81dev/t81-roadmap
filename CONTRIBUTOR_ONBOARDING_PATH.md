# Contributor Onboarding Path

This path defines how a contributor progresses from first issue to advanced
cross-repo migration work.

## Stage 0: Workspace Setup

1. Clone core repos:
   - `t81-roadmap`
   - `t81-vm`
   - `t81-lang`
   - `t81-python`
2. Verify baseline tooling:
   - `gh auth status`
   - `python3 --version`
   - `make --version`
3. Read:
   - `ROADMAP.md`
   - `STATUS.md`
   - `MIGRATION_STATUS.md`
4. Run consumer smoke path:
   - `t81-examples/scripts/run-runtime-v0.5-e2e.sh`

Exit criteria:
- local environment can run repo checks
- contributor understands current migration baseline (`runtime-contract` tag/version)
- contributor can execute the canonical consumer runtime path

## Stage 1: First Issue (Single Repo)

Pick a `good-first-issue` in one repo from `REPOSITORIES.md`.
You can use `docs/contributor-intake-board.md` for current cross-repo
good-first options.

Required workflow:
1. Link the issue in your PR.
2. Keep scope to one repo and one measurable acceptance.
3. Run repo-local validations before opening PR.

Exit criteria:
- merged PR with passing CI
- docs/tests updated with the change

## Stage 2: Runtime-Coupled Issue (Two Repos)

Take a compatibility or contract-aligned task touching runtime boundaries.

Required workflow:
1. If interface changes, open or link a `t81-roadmap` tracking issue.
2. Update local runtime marker (`contracts/runtime-contract.json`) if needed.
3. Validate against `t81-vm` contract checks and downstream compatibility gates.

Exit criteria:
- merged PR(s) with green compatibility CI
- baseline references synchronized in affected repos

## Stage 3: Cross-Repo Migration Slice (Three+ Repos)

Execute one migration slice with roadmap evidence.

Required workflow:
1. Define scope/acceptance in a roadmap tracker issue.
2. Land implementation in target repos with linked commits.
3. Regenerate roadmap evidence artifacts:
   - `ECOSYSTEM_RELEASE_MANIFEST.json`
   - `MIGRATION_DASHBOARD.md`
   - `MIGRATION_STATUS.md`
   - `MIGRATION_CHECKPOINTS.md` (if promotion/event milestone)

Exit criteria:
- all linked issues closed
- evidence URLs and commit pins recorded

## Stage 4: Advanced Maintainer Track

Own a contract promotion or phase kickoff execution.

Required workflow:
1. Produce a written promotion/kickoff scope.
2. Coordinate downstream synchronization and CI evidence collection.
3. Publish release/checkpoint artifacts under `releases/` and/or
   `MIGRATION_CHECKPOINTS.md`.

Exit criteria:
- promotion tracker closed with evidence links
- migration status remains green or blockers are auto-triaged

## Guardrails

- No performance claims without reproducible benchmark artifacts.
- No runtime contract promotions without synchronized downstream markers.
- No phase closure without linked implementation issues and evidence.
