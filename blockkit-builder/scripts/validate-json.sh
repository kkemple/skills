#!/usr/bin/env bash
# validate-json.sh — Deterministic Block Kit JSON structural validation
# Covers core constraints C01 (valid JSON + blocks array), C02 (type fields), C03/C04 (block count limits)
#
# Usage: ./validate-json.sh --file <path-to-json>
#
# Exit codes:
#   0 — clean (no findings)
#   1 — findings found (structural issues detected)
#   2 — script error (bad input, missing file, missing jq)
#
# Output: structured JSON to stdout matching the script findings format
# Diagnostics: progress and errors to stderr

set -euo pipefail

show_help() {
  cat <<'HELP'
Usage: validate-json.sh --file <path>

Validates Block Kit JSON structural integrity.

Flags:
  --file <path>   Path to the Block Kit JSON file (required)
  --help          Show this help message

Checks performed:
  C01: File contains valid, parseable JSON
  C02: JSON contains a top-level "blocks" array
  C03: Every block in the array has a "type" field
  C04: Block count does not exceed 100 (surface-specific 50-block message limit requires surface context)

Exit codes:
  0  Clean — no structural issues
  1  Findings — structural issues detected (see stdout JSON)
  2  Error — bad input, missing file, or missing dependency (jq)
HELP
}

# Parse args
FILE=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --file) FILE="$2"; shift 2 ;;
    --help) show_help; exit 0 ;;
    *) echo "Error: unknown flag '$1'. Use --help for usage." >&2; exit 2 ;;
  esac
done

if [[ -z "$FILE" ]]; then
  echo "Error: --file is required. Use --help for usage." >&2
  exit 2
fi

if [[ ! -f "$FILE" ]]; then
  echo "Error: file not found: $FILE" >&2
  exit 2
fi

if ! command -v jq &>/dev/null; then
  echo "Error: jq is required but not installed." >&2
  exit 2
fi

echo "Validating: $FILE" >&2

FINDINGS="[]"
add_finding() {
  local id="$1" constraint="$2" desc="$3" evidence="$4"
  FINDINGS=$(echo "$FINDINGS" | jq --arg id "$id" --arg c "$constraint" --arg d "$desc" --arg e "$evidence" --arg f "$FILE" \
    '. += [{"id": $id, "location": {"file": $f, "position": "top-level", "context": ""}, "constraint": $c, "description": $d, "evidence": $e}]')
}

# C01: Valid JSON
if ! jq empty "$FILE" 2>/dev/null; then
  add_finding "S001" "C01" "File is not valid JSON" "jq failed to parse the file"
  # Can't check further if JSON is invalid
  TOTAL=$(echo "$FINDINGS" | jq 'length')
  jq -n --argjson findings "$FINDINGS" --argjson total "$TOTAL" \
    '{"script": "validate-json", "findings": $findings, "summary": {"total": $total, "checked": "C01 (parse failed, skipped C02-C04)"}}'
  exit 1
fi
echo "  C01: Valid JSON ✓" >&2

# C02: blocks array exists
HAS_BLOCKS=$(jq 'if type == "object" and (.blocks | type) == "array" then true else false end' "$FILE")
if [[ "$HAS_BLOCKS" != "true" ]]; then
  add_finding "S002" "C02" "JSON does not contain a top-level blocks array" "Expected .blocks to be an array"
fi
echo "  C02: blocks array check done" >&2

# C03: Every block has a type field (only if blocks array exists)
if [[ "$HAS_BLOCKS" == "true" ]]; then
  MISSING_TYPE=$(jq '[.blocks | to_entries[] | select(.value.type == null) | .key] | length' "$FILE")
  if [[ "$MISSING_TYPE" -gt 0 ]]; then
    INDICES=$(jq -r '[.blocks | to_entries[] | select(.value.type == null) | .key] | join(", ")' "$FILE")
    add_finding "S003" "C03" "Block(s) missing type field" "Blocks at indices [$INDICES] have no type field"
  fi
  echo "  C03: type field check done" >&2

  # C04: Block count
  BLOCK_COUNT=$(jq '.blocks | length' "$FILE")
  if [[ "$BLOCK_COUNT" -gt 100 ]]; then
    add_finding "S004" "C04" "Block count exceeds maximum (100)" "Found $BLOCK_COUNT blocks — exceeds the 100-block limit for modals and Home tabs"
  fi
  echo "  C04: block count check done ($BLOCK_COUNT blocks)" >&2
fi

TOTAL=$(echo "$FINDINGS" | jq 'length')

jq -n --argjson findings "$FINDINGS" --argjson total "$TOTAL" \
  '{"script": "validate-json", "findings": $findings, "summary": {"total": $total, "checked": "C01 (valid JSON), C02 (blocks array), C03 (type fields), C04 (block count)"}}'

if [[ "$TOTAL" -gt 0 ]]; then
  exit 1
else
  exit 0
fi
