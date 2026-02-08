# Ecosystem Release Cut: 2026-02-08

Release type: weekly ecosystem baseline cut.

## Runtime Contract Baseline

- Runtime tag: `runtime-contract-v0.4`
- Contract version: `2026-02-08-v4`
- VM baseline pin: `fc9d55eba258aa2d17d7778e29e186f0bf62e2d8`

## Manifest Pinned SHAs

Source: `ECOSYSTEM_RELEASE_MANIFEST.json` generated at `2026-02-08T22:33:48Z`.

- `t81-vm`: `c7e2a975c589d2f724e4e2c2425595185ccf8d94`
- `t81-lang`: `93a47188d3a61d4d19759d99ad0cd135518f2691`
- `t81-python`: `33e300607e13640e9479d224b8657e39de5dc844`
- `t81-docs`: `98c90eb3c3d2e55ca86d3b257c28b615b5e3cbf8`
- `t81-examples`: `fc578305e2294fa78c92ba357248273bbbca4f01`
- `ternary-tools`: `e8fbb01cde5f3ec41326bbce4d035e5c2a1fa6d0`
- `ternary-pager`: `d838f09782436f86484ad65731251ef4d65127fe`
- `t81-benchmarks`: `c06c9c4951a4919e94158ae81f0c76a533fee710`
- `t81-roadmap`: `5aa2b34341d5267480df8cd8ef38963c92913714`

## CI Evidence

- `t81-vm` `ecosystem-contract`: https://github.com/t81dev/t81-vm/actions/runs/21806065328
- `t81-vm` `ecosystem-compat-matrix`: workflow enabled in this cut (use next scheduled run as baseline evidence artifact).
- `t81-lang` `ci`: https://github.com/t81dev/t81-lang/actions/runs/21805815150
- `t81-python` `CI`: https://github.com/t81dev/t81-python/actions/runs/21805815246
- `t81-docs` `Docs Validate`: https://github.com/t81dev/t81-docs/actions/runs/21806140918

## Migration Status

- Status board at cut time: `MIGRATION_STATUS.md` (all tracked repos green).
- Blocker issue policy: managed by `migration-status.yml` auto-triage workflow.

## Follow-up

1. Confirm first successful scheduled `ecosystem-compat-matrix` run and append URL to this release record.
2. Publish monthly benchmark evidence bundle under `t81-benchmarks/publications/2026-03/`.
