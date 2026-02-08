# Ecosystem Migration Dashboard

Snapshot date: 2026-02-08.

## Runtime Contract

- Canonical owner: `t81-vm`
- Contract file: `t81-vm/docs/contracts/vm-compatibility.json`
- Contract version: `2026-02-08`
- Contract tag baseline: `runtime-contract-v0.1`
- Supported opcode count: `29`

## VM Parity

- Opcode coverage: `29` (`t81-vm`) vs `81` (`t81-foundation`)
- VM conformance tests: `10` (`t81-vm`) vs `13` (`t81-foundation`)
- Source of parity backlog: `t81-vm/docs/parity-backlog.md`

## Cross-Repo Contract CI

| Repo | Workflow | Latest Conclusion | Completed At (UTC) |
| --- | --- | --- | --- |
| `t81dev/t81-vm` | `ecosystem-contract` | [success](https://github.com/t81dev/t81-vm/actions/runs/21802505156) | 2026-02-08T17:43:33Z |
| `t81dev/t81-lang` | `ci` | [failure](https://github.com/t81dev/t81-lang/actions/runs/21802456750) | 2026-02-08T17:40:02Z |
| `t81dev/t81-python` | `CI` | [failure](https://github.com/t81dev/t81-python/actions/runs/21802456602) | 2026-02-08T17:40:01Z |
| `t81dev/t81-docs` | `Docs Validate` | [success](https://github.com/t81dev/t81-docs/actions/runs/21802456600) | 2026-02-08T17:40:01Z |

## Failing Checks

- `t81dev/t81-lang` / `ci`: failure
- `t81dev/t81-python` / `CI`: failure

## Update Rule

- Regenerate this dashboard whenever `t81-vm` contract/parity docs or any cross-repo compatibility workflow changes.
