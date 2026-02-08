#!/usr/bin/env python3
"""Generate ecosystem release manifest with pinned SHAs."""

from __future__ import annotations

import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path


REPOS = [
    "t81-vm",
    "t81-lang",
    "t81-python",
    "t81-docs",
    "t81-examples",
    "ternary-tools",
    "ternary-pager",
    "t81-benchmarks",
    "t81-roadmap",
]


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def read_sha(repo_dir: Path) -> str:
    return subprocess.check_output(
        ["git", "-C", str(repo_dir), "rev-parse", "HEAD"], text=True
    ).strip()


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    code_root = (root / "..").resolve()
    vm_dir = code_root / "t81-vm"
    vm_contract = read_json(vm_dir / "docs/contracts/vm-compatibility.json")
    vm_marker = read_json(vm_dir / "contracts/runtime-contract.json")

    pins: dict[str, str] = {}
    for repo in REPOS:
        repo_dir = code_root / repo
        pins[repo] = read_sha(repo_dir)

    manifest = {
        "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "runtime_contract": {
            "tag": "runtime-contract-v0.4",
            "contract_version": vm_contract.get("contract_version"),
            "vm_main_pin": vm_marker.get("vm_main_pin"),
        },
        "release_cadence": {
            "type": "weekly",
            "day_utc": "Monday",
            "owner": "t81-roadmap",
        },
        "repo_pins": pins,
    }

    out = root / "ECOSYSTEM_RELEASE_MANIFEST.json"
    out.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
