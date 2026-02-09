# Runtime v0.6 Downstream Impact Checklist

Tracker: https://github.com/t81dev/t81-roadmap/issues/24

Use this checklist before any `runtime-contract-v0.6` promotion execution.

## Scope

- Baseline from: `runtime-contract-v0.5`
- Target: `runtime-contract-v0.6` planning and promotion readiness
- ABI policy: keep `host_abi.version` in `0.1.x` unless separate ABI-break RFC is approved

## Downstream Repos

| Repo | Owner | Required Update | Status |
| --- | --- | --- | --- |
| `t81-vm` | `@t81dev` | RFC + contract delta + validator updates | `in_progress` |
| `t81-lang` | `@t81dev` | compatibility matrix/docs + marker sync | `pending` |
| `t81-python` | `@t81dev` | bridge compatibility docs/tests + marker sync | `pending` |
| `t81-docs` | `@t81dev` | runtime contract docs sync | `pending` |
| `t81-examples` | `@t81dev` | canonical bundles/CI sync + marker updates | `pending` |
| `t81-foundation` | `@t81dev` | boundary doc + marker + runtime-contract workflow sync | `pending` |
| `t81-roadmap` | `@t81dev` | manifest/dashboard/status/checkpoint evidence updates | `in_progress` |

## Promotion Gate Evidence

1. Green compatibility workflows in all downstream repos above.
2. Updated `ECOSYSTEM_RELEASE_MANIFEST.json`.
3. Updated `MIGRATION_DASHBOARD.md`, `MIGRATION_STATUS.md`, and blockers map.
4. Promotion artifact under `releases/YYYY-MM-DD-runtime-contract-v0.6-promotion.md`.
