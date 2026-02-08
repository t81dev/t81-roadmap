#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-t81dev}"
OUT="${2:-REPOSITORIES.md}"
SNAPSHOT_DATE="$(date -u +"%B %d, %Y")"

for bin in curl jq; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "Missing required dependency: $bin" >&2
    exit 1
  fi
done

tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT

curl -s "https://api.github.com/users/${OWNER}/repos?per_page=100" \
  | jq -r '.[] | [.name, .html_url, (.description // ""), (.language // "n/a"), (.pushed_at // "n/a")] | join("\u001f")' \
  | sort > "$tmp_file"

declare -A REPO_GROUPS=(
  [t81-foundation]="Foundation and Specs"
  [duotronic-whitepaper]="Foundation and Specs"
  [duotronic-computing]="Foundation and Specs"
  [duotronic-thesis]="Foundation and Specs"
  [t81-constraints]="Foundation and Specs"
  [ternary]="Quantization and Model Runtime"
  [t81lib]="Quantization and Model Runtime"
  [t81-python]="Quantization and Model Runtime"
  [llama.cpp]="Quantization and Model Runtime"
  [ANGELA]="Quantization and Model Runtime"
  [ternary-tools]="Tooling and Observability"
  [ternary-pager]="Tooling and Observability"
  [t81-benchmarks]="Tooling and Observability"
  [t81-hardware]="Hardware and Systems"
  [ternary-fabric]="Hardware and Systems"
  [ternary-memory-research]="Hardware and Systems"
  [ternary_gcc_plugin]="Hardware and Systems"
  [trinity]="Cryptography Experiments"
  [trinity-decrypt]="Cryptography Experiments"
  [trinity-pow]="Cryptography Experiments"
  [t81-docs]="Docs, Narrative, and Program Coordination"
  [t81-examples]="Docs, Narrative, and Program Coordination"
  [t81-roadmap]="Docs, Narrative, and Program Coordination"
  [ternary-delta]="Docs, Narrative, and Program Coordination"
)

categories=(
  "Foundation and Specs"
  "Quantization and Model Runtime"
  "Tooling and Observability"
  "Hardware and Systems"
  "Cryptography Experiments"
  "Docs, Narrative, and Program Coordination"
  "Uncategorized"
)

{
  echo "# Repository Catalog"
  echo
  echo "Snapshot date: ${SNAPSHOT_DATE}."
  echo "Source: \`https://github.com/${OWNER}\`"
  echo

  for category in "${categories[@]}"; do
    echo "## ${category}"
    echo

    found=0
    while IFS=$'\x1f' read -r name url desc language pushed_at; do
      group="${REPO_GROUPS[$name]:-Uncategorized}"
      if [[ "$group" != "$category" ]]; then
        continue
      fi

      found=1
      short_date="${pushed_at%%T*}"
      clean_desc="$desc"
      if [[ -z "$clean_desc" ]]; then
        clean_desc="No description provided."
      fi

      echo "- \`${name}\` (${language}): ${clean_desc} [repo](${url}) | last push: ${short_date}."
    done < "$tmp_file"

    if [[ "$found" -eq 0 ]]; then
      echo "- None currently mapped."
    fi

    echo
  done

  echo "## Suggested Ownership Pattern"
  echo
  echo "- Normative specs: \`t81-foundation\`, \`duotronic-whitepaper\`, \`t81-constraints\`."
  echo "- Reproducibility/evidence: \`t81-benchmarks\`, \`t81-examples\`."
  echo "- Integration glue: \`t81-python\`, \`ternary-tools\`, \`t81-docs\`."
  echo "- Long-range R&D: \`t81-hardware\`, \`ternary-fabric\`, \`ternary-memory-research\`."
} > "$OUT"

echo "Wrote ${OUT} from https://api.github.com/users/${OWNER}/repos"
