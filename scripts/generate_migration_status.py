#!/usr/bin/env python3
"""Generate migration status board from release manifest + contract markers."""

from __future__ import annotations

import json
from datetime import datetime, timezone
from pathlib import Path


OWNER_MAP = {
    "t81-vm": "@t81dev",
    "t81-lang": "@t81dev",
    "t81-python": "@t81dev",
    "t81-docs": "@t81dev",
    "t81-examples": "@t81dev",
    "ternary-tools": "@t81dev",
    "ternary-pager": "@t81dev",
    "t81-benchmarks": "@t81dev",
    "t81-roadmap": "@t81dev",
}

BLOCKER_MAP = {
    "t81-vm": "none",
    "t81-lang": "none",
    "t81-python": "none",
    "t81-docs": "none",
    "t81-examples": "none",
    "ternary-tools": "none",
    "ternary-pager": "none",
    "t81-benchmarks": "none",
    "t81-roadmap": "none",
}


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def marker_status(repo_root: Path, repo: str, expected_contract_version: str) -> str:
    marker = repo_root / repo / "contracts/runtime-contract.json"
    if not marker.exists():
        return "yellow"
    marker_json = read_json(marker)
    if marker_json.get("contract_version") != expected_contract_version:
        return "red"
    return "green"


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    code_root = (root / "..").resolve()
    manifest = read_json(root / "ECOSYSTEM_RELEASE_MANIFEST.json")
    expected_contract_version = str(manifest["runtime_contract"]["contract_version"])
    blocker_file = root / "MIGRATION_BLOCKERS.json"
    blocker_map = BLOCKER_MAP
    if blocker_file.exists():
        blocker_data = read_json(blocker_file)
        blocker_map = {**BLOCKER_MAP, **blocker_data.get("blockers", {})}

    rows = []
    for repo, sha in manifest["repo_pins"].items():
        status = marker_status(code_root, repo, expected_contract_version)
        rows.append(
            f"| `{repo}` | {status} | {OWNER_MAP.get(repo, 'TBD')} | `{sha[:12]}` | {blocker_map.get(repo, 'none')} |"
        )

    lines = [
        "# Migration Status Board",
        "",
        f"Snapshot time (UTC): {datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')}.",
        "",
        "Legend: `green` = contract marker aligned, `yellow` = marker missing, `red` = marker drift.",
        "",
        "| Repo | Status | Owner | Last Verified SHA | Blocking Issue |",
        "| --- | --- | --- | --- | --- |",
        *rows,
        "",
        "Source of truth: `ECOSYSTEM_RELEASE_MANIFEST.json`.",
        "Blocker map source: `MIGRATION_BLOCKERS.json`.",
    ]

    out = root / "MIGRATION_STATUS.md"
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
