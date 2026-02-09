# Phase 4 Security and Applied Domains Matrix

Tracker: https://github.com/t81dev/t81-roadmap/issues/5

Snapshot date: 2026-02-08.

## Evaluation Plan

| Workstream | Repo | Objective | Acceptance Check | Implementation Issue |
| --- | --- | --- | --- | --- |
| P4-S1 | `trinity` | Formalize baseline security evaluation flow and reporting envelope | Evaluation plan committed with measurable pass/fail outputs | https://github.com/t81dev/trinity/issues/1 |
| P4-S2 | `trinity-decrypt` | Define decrypt-path correctness + abuse-case test matrix | Benchmark/eval matrix committed and aligned with roadmap signals | https://github.com/t81dev/trinity-decrypt/issues/1 |
| P4-S3 | `trinity-pow` | Define workload/security cost evaluation and anti-abuse checks | Threat-model notes + benchmark mapping committed | https://github.com/t81dev/trinity-pow/issues/1 |

## Benchmark Alignment

Phase 4 benchmark evidence must align with `t81-benchmarks` publication rules.

Required alignment points:
1. Output format:
   use JSON artifacts compatible with `t81-benchmarks/benchmarks/results/schema.json` when publishing comparable claims.
2. Publication cadence:
   Phase 4 evidence is included in monthly publication windows defined by `t81-benchmarks/docs/publication-cadence.md`.
3. Release pinning:
   every Phase 4 evidence release references the active `ECOSYSTEM_RELEASE_MANIFEST.json` contract version + VM pin.

## Threat-Model Notes and Limits

Threat-model notes for Phase 4 contributions must include:
1. Assets:
   keys, ciphertext/plaintext boundaries, integrity-critical metadata, and deterministic execution traces.
2. Adversaries:
   offline brute-force attacker, online abuse/spam actor, malformed-input actor, replay/tamper actor.
3. Trust boundaries:
   API boundaries, artifact import/export paths, benchmark harness boundaries, and operator-controlled configuration surfaces.
4. Non-goals:
   no claims of production-grade cryptographic guarantees until independent review + reproducible evidence are both published.
5. Failure reporting:
   every discovered failure mode must be recorded with reproducible trigger steps and linked issue references.

## Promotion Rule

Phase 4 can be considered complete only when all three implementation issues are closed
with linked benchmark/evaluation artifacts and threat-model notes.

## Evidence Freshness Policy

- Freshness threshold: `30` days since last linked issue evidence update.
- Freshness report artifact: `PHASE_EVIDENCE_STATUS.md`.
- Weekly enforcement path:
  - `scripts/check_phase_evidence_freshness.py`
  - stale alerts managed in `t81-roadmap` with label `phase-evidence-stale`.
