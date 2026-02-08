# Ecosystem Migration Dashboard

Snapshot date: 2026-02-08.

## Runtime Contract

- Canonical owner: `t81-vm`
- Contract file: `t81-vm/docs/contracts/vm-compatibility.json`
- Contract version: `2026-02-08-v2`
- Active tagged contract baseline: `runtime-contract-v0.2`
- Contract commit pin (`t81-vm/main`): `578864456f409bb54c195319663f2b7351a830f9`
- Supported opcode count: `81`

## VM Parity

- Opcode coverage: `81` (`t81-vm`) vs `81` (`t81-foundation`)
- VM conformance tests: `13` (`t81-vm`) vs `13` (`t81-foundation`)
- Source of parity backlog: `t81-vm/docs/parity-backlog.md`

## Cross-Repo Contract CI

| Repo | Workflow | Latest Conclusion | Completed At (UTC) |
| --- | --- | --- | --- |
| `t81dev/t81-vm` | `ecosystem-contract` | [success](https://github.com/t81dev/t81-vm/actions/runs/21804705953) | 2026-02-08T20:18:27Z |
| `t81dev/t81-lang` | `ci` | [success](https://github.com/t81dev/t81-lang/actions/runs/21804446742) | 2026-02-08T20:01:04Z |
| `t81dev/t81-python` | `CI` | [success](https://github.com/t81dev/t81-python/actions/runs/21804446817) | 2026-02-08T20:01:04Z |
| `t81dev/t81-docs` | `Docs Validate` | [success](https://github.com/t81dev/t81-docs/actions/runs/21804471504) | 2026-02-08T20:02:36Z |

## Failing Checks

- None.

## Update Rule

- Regenerate this dashboard whenever `t81-vm` contract/parity docs or any cross-repo compatibility workflow changes.
