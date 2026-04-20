# Ecosystem Migration Dashboard

Snapshot date: 2026-04-20.

## Runtime Contract

- Canonical owner: `t81-vm`
- Contract file: `t81-vm/docs/contracts/vm-compatibility.json`
- Contract version: `2026-02-08-v5`
- Active tagged contract baseline: `runtime-contract-v0.5`
- Contract commit pin (`t81-vm/main`): `4158a42156a085a2b722205be951576fc01969b9`
- Supported opcode count: `81`
- Execution-mode parity evidence: `build/mode-parity/parity-evidence.json` (`parity-evidence-v1`)

## VM Parity

- Opcode coverage: `81` (`t81-vm`) vs `81` (`t81-foundation`)
- VM conformance tests: `13` (`t81-vm`) vs `13` (`t81-foundation`)
- Source of parity backlog: `t81-vm/docs/parity-backlog.md`

## Cross-Repo Contract CI

| Repo | Workflow | Latest Conclusion | Completed At (UTC) |
| --- | --- | --- | --- |
| `t81dev/t81-foundation` | `runtime-contract` | [success](https://github.com/t81dev/t81-foundation/actions/runs/24651829144) | 2026-04-20T06:28:29Z |
| `t81dev/t81-vm` | `ecosystem-contract` | [success](https://github.com/t81dev/t81-vm/actions/runs/21809608188) | 2026-02-09T01:50:01Z |
| `t81dev/t81-vm` | `ecosystem-compat-matrix` | [failure](https://github.com/t81dev/t81-vm/actions/runs/24229592638) | 2026-04-10T06:24:08Z |
| `t81dev/t81-lang` | `ci` | [failure](https://github.com/t81dev/t81-lang/actions/runs/21839081919) | 2026-02-09T20:21:46Z |
| `t81dev/t81-python` | `CI` | [success](https://github.com/t81dev/t81-python/actions/runs/21807280712) | 2026-02-08T23:22:57Z |
| `t81dev/t81-docs` | `Docs Validate` | [success](https://github.com/t81dev/t81-docs/actions/runs/21807864177) | 2026-02-09T00:05:24Z |
| `t81dev/t81-examples` | `runtime-v0.5-e2e` | [success](https://github.com/t81dev/t81-examples/actions/runs/24331129227) | 2026-04-13T07:29:05Z |

## Failing Checks

- `t81dev/t81-vm` / `ecosystem-compat-matrix`: failure
- `t81dev/t81-lang` / `ci`: failure

## Update Rule

- Regenerate this dashboard whenever `t81-vm` contract/parity docs or any cross-repo compatibility workflow changes.
