# Phase 1 Core Stack Stabilization Matrix

Tracker: https://github.com/t81dev/t81-roadmap/issues/2

Snapshot date: 2026-02-08.

## Stabilization Workstreams

| Workstream | Repo | Objective | Acceptance Check | Implementation Issue |
| --- | --- | --- | --- | --- |
| P1-S1 | `t81-foundation` | Lock runtime semantics boundary against VM execution contract | Runtime semantics lock note committed in `spec/` with explicit mapping to VM contract scope | https://github.com/t81dev/t81-foundation/issues/112 |
| P1-S2 | `t81lib` | Harden arithmetic and quantization primitives | Quantization hardening checklist + reproducible validation artifact committed | https://github.com/t81dev/t81lib/issues/1 |
| P1-S3 | `ternary_gcc_plugin` | Validate GCC plugin ABI contract and drift policy | ABI contract note + compatibility validation path committed | https://github.com/t81dev/ternary_gcc_plugin/issues/1 |
| P1-S4 | `t81-python` | Keep Python bridge contract docs synchronized with VM baseline updates | Compatibility note stays pinned to active VM contract and bridge tests remain green | https://github.com/t81dev/t81-python/issues/4 |

## Runtime Contract Gates

Phase 1 execution must maintain:

1. ABI pin consistency across `t81-vm`, `t81-lang`, and `t81-python`.
2. Explicit lock boundary between normative semantics (`t81-foundation/spec`) and executable behavior (`t81-vm`).
3. Quantization behavior reproducibility for promoted claims.
4. GCC plugin ABI compatibility evidence tied to the same runtime contract baseline.
