#!/usr/bin/env python3
"""Evaluate Phase 3/4 evidence freshness and optionally manage stale issues."""

from __future__ import annotations

import json
import os
import re
import subprocess
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parent.parent
MAX_AGE_DAYS = int(os.environ.get("PHASE_EVIDENCE_MAX_AGE_DAYS", "30"))
MANAGE_ISSUES = os.environ.get("PHASE_EVIDENCE_MANAGE_ISSUES", "0") == "1"
ROADMAP_REPO = os.environ.get("PHASE_EVIDENCE_ROADMAP_REPO", "t81dev/t81-roadmap")
LABEL = os.environ.get("PHASE_EVIDENCE_STALE_LABEL", "phase-evidence-stale")

MATRICES = [
    ("phase-3", ROOT / "PHASE3_MILESTONE_MATRIX.md"),
    ("phase-4", ROOT / "PHASE4_SECURITY_MATRIX.md"),
]
ISSUE_URL_RE = re.compile(r"https://github.com/([^/\s]+)/([^/\s]+)/issues/([0-9]+)")


@dataclass
class EvidenceIssue:
    phase: str
    owner: str
    repo: str
    number: int
    url: str
    title: str
    state: str
    updated_at: str
    age_days: int
    stale: bool

    @property
    def key(self) -> str:
        return f"{self.owner}/{self.repo}#{self.number}"


def github_json(url: str) -> dict:
    headers = {"Accept": "application/vnd.github+json"}
    token = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"Bearer {token}"
    req = Request(url, headers=headers)
    with urlopen(req, timeout=20) as resp:
        return json.loads(resp.read().decode("utf-8"))


def fetch_issue(owner: str, repo: str, number: int) -> dict:
    return github_json(f"https://api.github.com/repos/{owner}/{repo}/issues/{number}")


def parse_matrix_issue_urls() -> list[tuple[str, str, str, int, str]]:
    found: list[tuple[str, str, str, int, str]] = []
    seen: set[str] = set()
    for phase, matrix in MATRICES:
        text = matrix.read_text(encoding="utf-8")
        for owner, repo, num in ISSUE_URL_RE.findall(text):
            key = f"{owner}/{repo}#{num}"
            if key in seen:
                continue
            seen.add(key)
            found.append((phase, owner, repo, int(num), f"https://github.com/{owner}/{repo}/issues/{num}"))
    return found


def evaluate() -> list[EvidenceIssue]:
    now = datetime.now(timezone.utc)
    results: list[EvidenceIssue] = []
    for phase, owner, repo, number, url in parse_matrix_issue_urls():
        payload = fetch_issue(owner, repo, number)
        updated_raw = str(payload.get("updated_at") or "").strip()
        updated = datetime.fromisoformat(updated_raw.replace("Z", "+00:00"))
        age_days = max(0, (now - updated).days)
        stale = age_days > MAX_AGE_DAYS
        results.append(
            EvidenceIssue(
                phase=phase,
                owner=owner,
                repo=repo,
                number=number,
                url=url,
                title=str(payload.get("title") or ""),
                state=str(payload.get("state") or "unknown"),
                updated_at=updated_raw,
                age_days=age_days,
                stale=stale,
            )
        )
    return sorted(results, key=lambda x: (x.phase, x.owner, x.repo, x.number))


def write_outputs(issues: list[EvidenceIssue]) -> tuple[Path, Path]:
    stale = [i for i in issues if i.stale]
    out_json = ROOT / "PHASE_EVIDENCE_STATUS.json"
    out_md = ROOT / "PHASE_EVIDENCE_STATUS.md"

    payload = {
        "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "max_age_days": MAX_AGE_DAYS,
        "stale_count": len(stale),
        "issues": [
            {
                "phase": i.phase,
                "repo": f"{i.owner}/{i.repo}",
                "number": i.number,
                "url": i.url,
                "title": i.title,
                "state": i.state,
                "updated_at": i.updated_at,
                "age_days": i.age_days,
                "stale": i.stale,
            }
            for i in issues
        ],
    }
    out_json.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    lines = [
        "# Phase Evidence Freshness",
        "",
        f"- Snapshot time (UTC): {payload['generated_at_utc']}",
        f"- Freshness threshold: `{MAX_AGE_DAYS}` days",
        f"- Stale issue count: `{len(stale)}`",
        "",
        "| Phase | Issue | State | Last Updated (UTC) | Age (days) | Freshness |",
        "| --- | --- | --- | --- | --- | --- |",
    ]
    for i in issues:
        freshness = "stale" if i.stale else "fresh"
        lines.append(
            f"| `{i.phase}` | [`{i.owner}/{i.repo}#{i.number}`]({i.url}) | `{i.state}` | `{i.updated_at}` | `{i.age_days}` | `{freshness}` |"
        )
    out_md.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return out_json, out_md


def gh_json(args: list[str]) -> list[dict]:
    out = subprocess.check_output(args, text=True)
    return json.loads(out)


def gh_run(args: list[str]) -> str:
    return subprocess.check_output(args, text=True).strip()


def sync_stale_issues(issues: list[EvidenceIssue]) -> None:
    stale = [i for i in issues if i.stale]
    stale_by_key = {i.key: i for i in stale}
    title_prefix = "Phase evidence stale: "

    gh_run(
        [
            "gh",
            "label",
            "create",
            LABEL,
            "--repo",
            ROADMAP_REPO,
            "--color",
            "B60205",
            "--description",
            "Auto-managed stale Phase 3/4 evidence tracker",
            "--force",
        ]
    )

    open_items = gh_json(
        [
            "gh",
            "issue",
            "list",
            "--repo",
            ROADMAP_REPO,
            "--state",
            "open",
            "--label",
            LABEL,
            "--limit",
            "200",
            "--json",
            "number,title,url",
        ]
    )
    existing = {
        str(item["title"]).replace(title_prefix, "", 1): item
        for item in open_items
        if str(item.get("title", "")).startswith(title_prefix)
    }

    for key, item in stale_by_key.items():
        if key in existing:
            continue
        body = "\n".join(
            [
                "Phase evidence freshness check marked this linked implementation issue as stale.",
                "",
                f"- Phase: `{item.phase}`",
                f"- Linked issue: {item.url}",
                f"- Age: `{item.age_days}` days",
                f"- Freshness threshold: `{MAX_AGE_DAYS}` days",
                "",
                "Action:",
                "1. Attach updated reproducible evidence artifact(s) to the linked issue/repo docs.",
                "2. Re-run freshness check; this issue will auto-close when age returns within threshold.",
            ]
        )
        gh_run(
            [
                "gh",
                "issue",
                "create",
                "--repo",
                ROADMAP_REPO,
                "--title",
                f"{title_prefix}{key}",
                "--label",
                LABEL,
                "--body",
                body,
            ]
        )

    for key, item in existing.items():
        if key in stale_by_key:
            continue
        gh_run(
            [
                "gh",
                "issue",
                "close",
                str(item["number"]),
                "--repo",
                ROADMAP_REPO,
                "--comment",
                "Auto-closing: linked phase evidence is within freshness threshold.",
            ]
        )


def main() -> None:
    issues = evaluate()
    out_json, out_md = write_outputs(issues)
    stale_count = sum(1 for i in issues if i.stale)
    print(f"Wrote {out_json}")
    print(f"Wrote {out_md}")
    print(f"Phase evidence freshness check: {len(issues)} issues, {stale_count} stale")
    if MANAGE_ISSUES:
        sync_stale_issues(issues)
        print("Phase evidence stale issue sync: complete")


if __name__ == "__main__":
    main()
