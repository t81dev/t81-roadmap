# Ecosystem Migration Dashboard

Snapshot date: 2026-02-08.

## Runtime Contract

- Canonical owner: `t81-vm`
- Contract file: `t81-vm/docs/contracts/vm-compatibility.json`
- Contract version: `2026-02-08-v2`
- Latest tagged contract baseline: `runtime-contract-v0.1`
- Current migration contract pin (`t81-vm/main`): `30306b3`
- `runtime-contract-v0.2` status: prepared, not tagged
- Supported opcode count: `81`

## VM Parity

- Opcode coverage: `81` (`t81-vm`) vs `81` (`t81-foundation`)
- VM conformance tests: `13` (`t81-vm`) vs `13` (`t81-foundation`)
- Source of parity backlog: `t81-vm/docs/parity-backlog.md`

## Cross-Repo Contract CI

| Repo | Workflow | Latest Conclusion | Completed At (UTC) |
| --- | --- | --- | --- |
| `t81dev/t81-vm` | `ecosystem-contract` | [unknown](https://github.com/t81dev/t81-vm/actions/runs/21803908192) | 2026-02-08T19:22:45Z |
| `t81dev/t81-lang` | `ci` | [unknown](https://github.com/t81dev/t81-lang/actions/runs/21803908176) | 2026-02-08T19:22:45Z |
| `t81dev/t81-python` | `CI` | [unknown](https://github.com/t81dev/t81-python/actions/runs/21803908225) | 2026-02-08T19:22:45Z |
| `t81dev/t81-docs` | `Docs Validate` | [unknown](https://github.com/t81dev/t81-docs/actions/runs/21803908294) | 2026-02-08T19:22:45Z |

## Failing Checks

- None.

## Update Rule

- Regenerate this dashboard whenever `t81-vm` contract/parity docs or any cross-repo compatibility workflow changes.
