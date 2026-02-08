#!/usr/bin/env python3
"""Auto-create/close migration blocker issues from marker drift status."""

from __future__ import annotations

import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path


def run_json(cmd: list[str]) -> list[dict]:
    out = subprocess.check_output(cmd, text=True)
    return json.loads(out)


def run(cmd: list[str]) -> str:
    return subprocess.check_output(cmd, text=True).strip()


def marker_status(repo_root: Path, repo: str, expected_contract_version: str) -> str:
    marker = repo_root / repo / "contracts/runtime-contract.json"
    if not marker.exists():
        return "yellow"
    marker_json = json.loads(marker.read_text(encoding="utf-8"))
    if marker_json.get("contract_version") != expected_contract_version:
        return "red"
    return "green"


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    code_root = (root / "..").resolve()
    manifest = json.loads((root / "ECOSYSTEM_RELEASE_MANIFEST.json").read_text(encoding="utf-8"))
    expected_contract_version = str(manifest["runtime_contract"]["contract_version"])

    repo = "t81dev/t81-roadmap"
    label = "migration-blocker"
    run(
        [
            "gh",
            "label",
            "create",
            label,
            "--repo",
            repo,
            "--color",
            "D93F0B",
            "--description",
            "Auto-managed migration blocker from status drift",
            "--force",
        ]
    )

    open_blockers = run_json(
        [
            "gh",
            "issue",
            "list",
            "--repo",
            repo,
            "--label",
            label,
            "--state",
            "open",
            "--limit",
            "200",
            "--json",
            "number,title,url",
        ]
    )
    open_by_repo: dict[str, dict] = {}
    for item in open_blockers:
        title = str(item.get("title", ""))
        prefix = "Migration blocker: "
        if title.startswith(prefix):
            open_by_repo[title[len(prefix) :]] = item

    blocker_map: dict[str, str] = {}
    for repo_name in manifest["repo_pins"]:
        status = marker_status(code_root, repo_name, expected_contract_version)
        title = f"Migration blocker: {repo_name}"
        existing = open_by_repo.get(repo_name)
        if status in {"yellow", "red"}:
            if existing is None:
                issue_url = run(
                    [
                        "gh",
                        "issue",
                        "create",
                        "--repo",
                        repo,
                        "--title",
                        title,
                        "--label",
                        label,
                        "--body",
                        "\n".join(
                            [
                                f"Detected migration status drift for `{repo_name}`.",
                                "",
                                f"- Status: `{status}`",
                                f"- Expected contract version: `{expected_contract_version}`",
                                "- Source: `MIGRATION_STATUS.md` generation pass",
                            ]
                        ),
                    ]
                )
                blocker_map[repo_name] = issue_url
            else:
                blocker_map[repo_name] = str(existing["url"])
        else:
            blocker_map[repo_name] = "none"
            if existing is not None:
                run(
                    [
                        "gh",
                        "issue",
                        "close",
                        str(existing["number"]),
                        "--repo",
                        repo,
                        "--comment",
                        f"Auto-closing: `{repo_name}` returned to green status.",
                    ]
                )

    out = {
        "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "blockers": blocker_map,
    }
    out_path = root / "MIGRATION_BLOCKERS.json"
    out_path.write_text(json.dumps(out, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote {out_path}")


if __name__ == "__main__":
    main()
