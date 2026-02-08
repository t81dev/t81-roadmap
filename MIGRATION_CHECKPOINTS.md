# Migration Checkpoints

## 2026-02-08 - Runtime Contract v0.4 Promotion

- Promotion tracker: https://github.com/t81dev/t81-roadmap/issues/13
- Runtime baseline: `runtime-contract-v0.4`
- VM contract version: `2026-02-08-v4`
- Canonical commit pins:
  - `t81-vm`: `16b352b`
  - `t81-lang`: `199b49c`
  - `t81-python`: `8e4cfb1`
  - `t81-docs`: `ea87c6b`
  - `t81-roadmap`: `4968996`
- Evidence:
  - `t81-vm` `ci`: https://github.com/t81dev/t81-vm/actions/runs/21805869280
  - `t81-vm` `lang-compat`: https://github.com/t81dev/t81-vm/actions/runs/21805869289
  - `t81-vm` `ecosystem-contract`: https://github.com/t81dev/t81-vm/actions/runs/21805869279
  - `t81-lang` `ci`: https://github.com/t81dev/t81-lang/actions/runs/21805815150
  - `t81-python` `CI`: https://github.com/t81dev/t81-python/actions/runs/21805815246
  - `t81-docs` `Docs Validate`: https://github.com/t81dev/t81-docs/actions/runs/21805815242
- Scope landed:
  - machine-readable mode parity evidence metadata and validator enforcement
  - CI artifact publication for parity evidence in `ci` and `ecosystem-contract`
  - downstream compatibility/doc references synchronized to `runtime-contract-v0.4`

## 2026-02-08 - Runtime Contract v0.4 Evidence Phase

- Promotion tracker: https://github.com/t81dev/t81-roadmap/issues/13
- Runtime baseline (active tag): `runtime-contract-v0.3`
- VM contract version under v0.4 prep: `2026-02-08-v3`
- Canonical commit pins:
  - `t81-vm`: `b04ce02`
  - `t81-lang`: `ab8110e`
  - `t81-python`: `297ac5c`
  - `t81-docs`: `d7ee51a`
  - `t81-roadmap`: `c08d272`
- Evidence:
  - `t81-vm` `ci`: https://github.com/t81dev/t81-vm/actions/runs/21805638060
  - `t81-vm` `lang-compat`: https://github.com/t81dev/t81-vm/actions/runs/21805640005
  - `t81-vm` `ecosystem-contract`: https://github.com/t81dev/t81-vm/actions/runs/21805640049
  - `t81-docs` `Docs Validate`: https://github.com/t81dev/t81-docs/actions/runs/21805693375
- Scope landed:
  - mode parity evidence artifact generation (`build/mode-parity/parity-evidence.json`)
  - CI artifact publication and contract enforcement of parity evidence metadata
  - downstream docs/report generators updated with parity evidence references

## 2026-02-08 - Runtime Contract v0.3 Promotion

- Runtime baseline: `runtime-contract-v0.3`
- VM contract version: `2026-02-08-v3`
- Canonical commit pins:
  - `t81-vm`: `3fd42f6`
  - `t81-lang`: `25331a2`
  - `t81-python`: `297ac5c`
  - `t81-docs`: `ce97d7e`
  - `t81-roadmap`: `8f39703`
- Evidence:
  - `t81-vm` `ci`: https://github.com/t81dev/t81-vm/actions/runs/21804899539
  - `t81-vm` `ecosystem-contract`: https://github.com/t81dev/t81-vm/actions/runs/21804899527
  - `t81-lang` `ci`: https://github.com/t81dev/t81-lang/actions/runs/21804911390
  - `t81-python` `CI`: https://github.com/t81dev/t81-python/actions/runs/21804911368
  - `t81-docs` `Docs Validate`: https://github.com/t81dev/t81-docs/actions/runs/21805009436
- Promotion tracker: https://github.com/t81dev/t81-roadmap/issues/12
- Next promotion tracker: https://github.com/t81dev/t81-roadmap/issues/13

## 2026-02-08 - Runtime Baseline Alignment

- Runtime baseline: `runtime-contract-v0.2`
- VM contract version: `2026-02-08-v2`
- Canonical commit pins:
  - `t81-vm`: `5788644`
  - `t81-lang`: `eaad0fd`
  - `t81-python`: `2983c3a`
  - `t81-docs`: `2abe842`
  - `t81-roadmap`: `c35314d`
- Evidence:
  - `t81-vm` CI: https://github.com/t81dev/t81-vm/actions/runs/21804705964
  - `t81-docs` Docs Validate: https://github.com/t81dev/t81-docs/actions/runs/21804823509
  - `t81-lang` CI: https://github.com/t81dev/t81-lang/actions/runs/21804446742
  - `t81-python` CI: https://github.com/t81dev/t81-python/actions/runs/21804446817
- Next contract promotion tracker: https://github.com/t81dev/t81-roadmap/issues/12
