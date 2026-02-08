# Ecosystem Migration Dashboard

Snapshot date: 2026-02-08.

## Runtime Contract

- Canonical owner: `t81-vm`
- Contract file: `t81-vm/docs/contracts/vm-compatibility.json`
- Contract version: `2026-02-08-v3`
- Active tagged contract baseline: `runtime-contract-v0.3`
- Contract commit pin (`t81-vm/main`): `b04ce028f13512833c5bc37bd263293c536dd496`
- Supported opcode count: `81`
- Execution-mode parity evidence: `build/mode-parity/parity-evidence.json` (`parity-evidence-v1`)

## VM Parity

- Opcode coverage: `81` (`t81-vm`) vs `81` (`t81-foundation`)
- VM conformance tests: `13` (`t81-vm`) vs `13` (`t81-foundation`)
- Source of parity backlog: `t81-vm/docs/parity-backlog.md`

## Cross-Repo Contract CI

| Repo | Workflow | Latest Conclusion | Completed At (UTC) |
| --- | --- | --- | --- |
| `t81dev/t81-vm` | `ecosystem-contract` | [success](https://github.com/t81dev/t81-vm/actions/runs/21805640049) | 2026-02-08T21:24:52Z |
| `t81dev/t81-lang` | `ci` | [success](https://github.com/t81dev/t81-lang/actions/runs/21805053808) | 2026-02-08T20:44:05Z |
| `t81dev/t81-python` | `CI` | [success](https://github.com/t81dev/t81-python/actions/runs/21804911368) | 2026-02-08T20:33:35Z |
| `t81dev/t81-docs` | `Docs Validate` | [success](https://github.com/t81dev/t81-docs/actions/runs/21805693375) | 2026-02-08T21:28:35Z |

## Failing Checks

- None.

## Update Rule

- Regenerate this dashboard whenever `t81-vm` contract/parity docs or any cross-repo compatibility workflow changes.
