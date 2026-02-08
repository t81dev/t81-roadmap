# Runtime Contract Promotion: v0.5

Promotion tracker: https://github.com/t81dev/t81-roadmap/issues/14

## Runtime Contract Baseline

- Runtime tag: `runtime-contract-v0.5`
- Contract version: `2026-02-08-v5`
- VM tagged commit: `4158a42156a085a2b722205be951576fc01969b9`

## Scope

- VM contract delta:
  - added `compatibility_governance` metadata in `t81-vm/docs/contracts/vm-compatibility.json`
  - validator enforcement added in `t81-vm/scripts/check-vm-contract.py`
- Downstream synchronization:
  - contract markers upgraded to `runtime-contract-v0.5` / `2026-02-08-v5`
  - pinned VM refs in `t81-lang` and `t81-python` CI lanes upgraded to v0.5 pin
  - docs/runtime compatibility references updated in `t81-docs`, `t81-lang`, `t81-python`, and `t81-roadmap`

## Required CI Evidence

- `t81-vm` `ci`: https://github.com/t81dev/t81-vm/actions/runs/21806842109
- `t81-vm` `lang-compat`: https://github.com/t81dev/t81-vm/actions/runs/21806842110
- `t81-vm` `ecosystem-contract`: https://github.com/t81dev/t81-vm/actions/runs/21806842118
- `t81-lang` `ci`: https://github.com/t81dev/t81-lang/actions/runs/21806844336
- `t81-python` `CI`: https://github.com/t81dev/t81-python/actions/runs/21806844326
- `t81-docs` `Docs Validate`: https://github.com/t81dev/t81-docs/actions/runs/21806908191
