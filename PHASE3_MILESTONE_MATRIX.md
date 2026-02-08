# Phase 3 Milestone Matrix

Tracker: https://github.com/t81dev/t81-roadmap/issues/16

Snapshot date: 2026-02-08.

## Milestones

| Milestone | Repo | Scope | Acceptance Check | Implementation Issue |
| --- | --- | --- | --- | --- |
| P3-M1 | `t81-hardware` | Simulation + verification ladder (lint/sim/parity regression gates) | Milestone checklist + first reproducible evidence artifact committed | https://github.com/t81dev/t81-hardware/issues/2 |
| P3-M2 | `ternary-fabric` | Memory/interconnect handoff map to ecosystem validation | Integration checklist committed with measurable interface signals | https://github.com/t81dev/ternary-fabric/issues/42 |
| P3-M3 | `ternary-memory-research` | Validation hypotheses + kill-criteria experiment plan | Hypothesis matrix + next evidence path committed | https://github.com/t81dev/ternary-memory-research/issues/2 |

## Software-Hardware Co-Design Checkpoints

1. Contract checkpoint:
   `t81-vm` runtime contract pin + Phase 3 repo milestone artifacts agree on expected interfaces.
2. Evidence checkpoint:
   each Phase 3 repo publishes one reproducible artifact tied to the current `ECOSYSTEM_RELEASE_MANIFEST.json`.
3. Promotion checkpoint:
   Phase 3 issues above linked from roadmap status update before any phase promotion proposal.

## Execution Order

1. `t81-hardware` defines and validates simulation ladder baseline.
2. `ternary-fabric` aligns interconnect/memory experiment outputs to the same baseline.
3. `ternary-memory-research` validates hypotheses against kill criteria with artifacted runs.
4. `t81-roadmap` updates checkpoint log + status board with evidence links.
