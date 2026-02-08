# Ecosystem Migration Dashboard

Snapshot date: 2026-02-08.

## Runtime Contract

- Canonical owner: `t81-vm`
- Contract file: `t81-vm/docs/contracts/vm-compatibility.json`
- Contract version: `2026-02-08-v4`
- Active tagged contract baseline: `runtime-contract-v0.4`
- Contract commit pin (`t81-vm/main`): `fc9d55eba258aa2d17d7778e29e186f0bf62e2d8`
- Supported opcode count: `81`
- Execution-mode parity evidence: `build/mode-parity/parity-evidence.json` (`parity-evidence-v1`)

## VM Parity

- Opcode coverage: `81` (`t81-vm`) vs `81` (`t81-foundation`)
- VM conformance tests: `13` (`t81-vm`) vs `13` (`t81-foundation`)
- Source of parity backlog: `t81-vm/docs/parity-backlog.md`

## Cross-Repo Contract CI

| Repo | Workflow | Latest Conclusion | Completed At (UTC) |
| --- | --- | --- | --- |
| `t81dev/t81-vm` | `ecosystem-contract` | [success](https://github.com/t81dev/t81-vm/actions/runs/21806065328) | 2026-02-08T21:55:11Z |
| `t81dev/t81-lang` | `ci` | [success](https://github.com/t81dev/t81-lang/actions/runs/21805815150) | 2026-02-08T21:37:16Z |
| `t81dev/t81-python` | `CI` | [success](https://github.com/t81dev/t81-python/actions/runs/21805815246) | 2026-02-08T21:37:16Z |
| `t81dev/t81-docs` | `Docs Validate` | [success](https://github.com/t81dev/t81-docs/actions/runs/21806140918) | 2026-02-08T22:00:04Z |

## Failing Checks

- None.

## Update Rule

- Regenerate this dashboard whenever `t81-vm` contract/parity docs or any cross-repo compatibility workflow changes.
