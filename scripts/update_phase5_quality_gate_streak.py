#!/usr/bin/env python3
"""Update Phase 5 quality-gate streak tracker from workflow run history."""

from __future__ import annotations

import json
import os
from datetime import datetime, timezone
from pathlib import Path
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "docs/phase5-quality-gate-streak.md"
OWNER = os.environ.get("PHASE5_STREAK_OWNER", "t81dev")
REPO = os.environ.get("PHASE5_STREAK_REPO", "t81-roadmap")
WORKFLOW_NAME = os.environ.get("PHASE5_STREAK_WORKFLOW", "Phase5 Release Readiness")
TARGET = int(os.environ.get("PHASE5_STREAK_TARGET", "4"))
MAX_ROWS = int(os.environ.get("PHASE5_STREAK_MAX_ROWS", "12"))


def github_json(url: str) -> dict:
    headers = {"Accept": "application/vnd.github+json"}
    token = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    req = Request(url, headers=headers)
    with urlopen(req, timeout=20) as resp:
        return json.loads(resp.read().decode("utf-8"))


def fetch_runs() -> list[dict]:
    payload = github_json(
        f"https://api.github.com/repos/{OWNER}/{REPO}/actions/runs?per_page=100"
    )
    runs = payload.get("workflow_runs", [])
    filtered = [
        run
        for run in runs
        if run.get("name") == WORKFLOW_NAME and run.get("status") == "completed"
    ]
    filtered.sort(key=lambda r: r.get("created_at", ""), reverse=True)
    return filtered[:MAX_ROWS]


def streak_count(runs: list[dict]) -> int:
    streak = 0
    for run in runs:
        if run.get("conclusion") == "success":
            streak += 1
            continue
        break
    return streak


def format_date(raw: str) -> str:
    if not raw:
        return "n/a"
    try:
        dt = datetime.fromisoformat(raw.replace("Z", "+00:00"))
        return dt.strftime("%Y-%m-%d")
    except ValueError:
        return raw


def write(runs: list[dict]) -> None:
    current = streak_count(runs)
    lines = [
        "# Phase 5 Quality-Gate Streak",
        "",
        f"Snapshot date: {datetime.now(timezone.utc).strftime('%Y-%m-%d')}.",
        "",
        "Track consecutive weekly `Phase5 Release Readiness` green runs for",
        "P6-D3 (`t81-roadmap#21`).",
        "",
        "## Target",
        "",
        f"- Goal: `{TARGET}` consecutive weekly green runs.",
        f"- Current streak: `{current} / {TARGET}`.",
        "",
        "## Streak Log",
        "",
        "| Index | Date (UTC) | Workflow Run | Result |",
        "| --- | --- | --- | --- |",
    ]
    for idx, run in enumerate(runs, start=1):
        run_id = run.get("id")
        url = run.get("html_url", "")
        conclusion = (run.get("conclusion") or "unknown").lower()
        date_utc = format_date(str(run.get("created_at", "")))
        lines.append(
            f"| {idx} | {date_utc} | [#{run_id}]({url}) | `{conclusion}` |"
        )

    lines.extend(
        [
            "",
            "## Rule",
            "",
            "- If any weekly run is non-green, streak resets to `0` from that run forward.",
            "- Use this tracker plus `releases/*.md` records as the evidence source for `#21`.",
        ]
    )

    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {OUT}")
    print(f"Current streak: {current}/{TARGET}")


def main() -> None:
    runs = fetch_runs()
    if not runs:
        raise SystemExit(
            f"No completed runs found for workflow {WORKFLOW_NAME!r} in {OWNER}/{REPO}"
        )
    write(runs)


if __name__ == "__main__":
    main()
