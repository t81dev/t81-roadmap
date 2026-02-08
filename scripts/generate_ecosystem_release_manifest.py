#!/usr/bin/env python3
"""Generate ecosystem release manifest with pinned SHAs."""

from __future__ import annotations

import json
import subprocess
from datetime import datetime, timezone
from urllib.request import Request, urlopen
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

CI_WORKFLOWS = [
    ("t81dev/t81-vm", "ecosystem-contract"),
    ("t81dev/t81-vm", "ecosystem-compat-matrix"),
    ("t81dev/t81-lang", "ci"),
    ("t81dev/t81-python", "CI"),
    ("t81dev/t81-docs", "Docs Validate"),
]


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def read_sha(repo_dir: Path) -> str:
    return subprocess.check_output(
        ["git", "-C", str(repo_dir), "rev-parse", "HEAD"], text=True
    ).strip()


def latest_workflow_run(repo: str, workflow_name: str) -> dict:
    url = f"https://api.github.com/repos/{repo}/actions/runs?per_page=100"
    req = Request(url, headers={"Accept": "application/vnd.github+json"})
    with urlopen(req, timeout=20) as resp:
        payload = json.loads(resp.read().decode("utf-8"))
    runs = payload.get("workflow_runs", [])
    matches = [
        run
        for run in runs
        if run.get("name") == workflow_name and (run.get("conclusion") or "").strip()
    ]
    if not matches:
        return {
            "repo": repo,
            "workflow": workflow_name,
            "conclusion": "unknown",
            "run_url": "",
            "completed_at_utc": "",
        }
    matches.sort(key=lambda r: r.get("created_at", ""), reverse=True)
    run = matches[0]
    return {
        "repo": repo,
        "workflow": workflow_name,
        "conclusion": run.get("conclusion") or "unknown",
        "run_url": run.get("html_url") or "",
        "completed_at_utc": run.get("updated_at") or "",
    }


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

    ci_evidence = [latest_workflow_run(repo, workflow) for repo, workflow in CI_WORKFLOWS]

    manifest = {
        "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "runtime_contract": {
            "tag": vm_marker.get("runtime_tag"),
            "contract_version": vm_contract.get("contract_version"),
            "vm_main_pin": vm_marker.get("vm_main_pin"),
        },
        "release_cadence": {
            "type": "weekly",
            "day_utc": "Monday",
            "owner": "t81-roadmap",
        },
        "repo_pins": pins,
        "ci_evidence": ci_evidence,
    }

    out = root / "ECOSYSTEM_RELEASE_MANIFEST.json"
    out.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote {out}")


if __name__ == "__main__":
    main()
