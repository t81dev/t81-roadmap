#!/usr/bin/env python3
"""Generate recurring runtime golden-demo release artifact from manifest pins."""

from __future__ import annotations

import json
import os
from datetime import datetime, timezone
from pathlib import Path
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parent.parent
TEMPLATE = ROOT / "releases/templates/runtime-golden-demo-template.md"
DATE_UTC = datetime.now(timezone.utc).strftime("%Y-%m-%d")
OUT = ROOT / f"releases/{DATE_UTC}-runtime-golden-demo.md"


def github_json(url: str) -> dict:
    headers = {"Accept": "application/vnd.github+json"}
    token = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    req = Request(url, headers=headers)
    with urlopen(req, timeout=20) as resp:
        return json.loads(resp.read().decode("utf-8"))


def latest_run_url(repo: str, workflow_name: str) -> str:
    payload = github_json(f"https://api.github.com/repos/{repo}/actions/runs?per_page=100")
    runs = payload.get("workflow_runs", [])
    candidates = [
        run
        for run in runs
        if run.get("name") == workflow_name and (run.get("conclusion") or "").strip()
    ]
    if not candidates:
        return "n/a"
    candidates.sort(key=lambda r: r.get("created_at", ""), reverse=True)
    return str(candidates[0].get("html_url") or "n/a")


def main() -> None:
    manifest = json.loads((ROOT / "ECOSYSTEM_RELEASE_MANIFEST.json").read_text(encoding="utf-8"))
    template = TEMPLATE.read_text(encoding="utf-8")

    runtime = manifest.get("runtime_contract", {})
    pins = manifest.get("repo_pins", {})

    examples_run = latest_run_url("t81dev/t81-examples", "runtime-v0.5-e2e")
    phase5_run = latest_run_url("t81dev/t81-roadmap", "Phase5 Release Readiness")

    values = {
        "{{RUNTIME_TAG}}": str(runtime.get("tag", "n/a")),
        "{{CONTRACT_VERSION}}": str(runtime.get("contract_version", "n/a")),
        "{{VM_PIN}}": str(runtime.get("vm_main_pin", "n/a")),
        "{{MANIFEST_GENERATED_AT}}": str(manifest.get("generated_at_utc", "n/a")),
        "{{PIN_T81_LANG}}": str(pins.get("t81-lang", "n/a")),
        "{{PIN_T81_PYTHON}}": str(pins.get("t81-python", "n/a")),
        "{{PIN_T81_EXAMPLES}}": str(pins.get("t81-examples", "n/a")),
        "{{PIN_T81_FOUNDATION}}": str(pins.get("t81-foundation", "n/a")),
        "{{EXAMPLES_RUNTIME_SUITE_RUN_URL}}": examples_run,
        "{{ROADMAP_PHASE5_RUN_URL}}": phase5_run,
        "{{LOCAL_HASH_OR_NA}}": "n/a",
    }

    rendered = template.replace("`YYYY-MM-DD`", DATE_UTC)
    for key, value in values.items():
        rendered = rendered.replace(key, value)

    OUT.write_text(rendered, encoding="utf-8")
    print(f"Wrote {OUT}")


if __name__ == "__main__":
    main()
