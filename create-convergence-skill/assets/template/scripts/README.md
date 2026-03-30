# Scripts

Bundled validation scripts that return structured JSON. The sweeper and guardian can invoke these as part of their checks for deterministic, programmatically verifiable constraints.

## Design principles

Scripts in this directory follow agentic use patterns:

1. **No interactive prompts.** Agents run in non-interactive shells. Accept all input via command-line flags or stdin.

2. **`--help` documents the interface.** The agent reads `--help` to learn flags, expected inputs, and usage examples. Keep it concise — it enters the agent's context.

3. **Structured JSON to stdout.** Output findings as JSON matching the findings report format in SKILL.md. This lets the sweeper incorporate script output directly into its report.

4. **Diagnostics to stderr.** Progress messages, warnings, and debug info go to stderr so stdout stays parseable.

5. **Meaningful error messages.** "Error: invalid input" wastes a turn. "Error: --file expects a .tex path, received 'main.pdf'" gives the agent what it needs to self-correct.

6. **Meaningful exit codes.** 0 = clean (no findings). 1 = findings found (not an error — findings are expected output). 2 = script error (bad input, missing file, etc.). Document codes in `--help`.

7. **Idempotent.** Agents may retry. Running the same script twice on the same input produces the same output.

8. **Self-contained dependencies.** Use inline dependency declarations (PEP 723 for Python, npm: imports for Deno) so the script runs with a single command. No separate install step.

## Output format

Scripts should output JSON matching this structure (subset of the findings report):

```json
{
  "script": "script_name",
  "findings": [
    {
      "id": "S001",
      "location": {
        "file": "path",
        "position": "line or section",
        "context": "surrounding text"
      },
      "constraint": "C01",
      "description": "what was found",
      "evidence": "specific violation"
    }
  ],
  "summary": {
    "total": 0,
    "checked": "what was checked"
  }
}
```

The sweeper incorporates script findings into its report, adding confidence scores based on the constraint type (script-verified findings from deterministic checks typically get high issue confidence).

## Example

```python
# /// script
# dependencies = []
# ///

"""Check for forbidden terms in artifact."""

import argparse
import json
import sys

def main():
    parser = argparse.ArgumentParser(description="Check for forbidden terms")
    parser.add_argument("--file", required=True, help="Path to artifact file")
    parser.add_argument("--terms", required=True, help="Path to terms file (one per line)")
    args = parser.parse_args()

    try:
        with open(args.file) as f:
            content = f.read()
            lines = content.splitlines()
    except FileNotFoundError:
        print(f"Error: file not found: {args.file}", file=sys.stderr)
        sys.exit(2)

    try:
        with open(args.terms) as f:
            terms = [t.strip() for t in f if t.strip()]
    except FileNotFoundError:
        print(f"Error: terms file not found: {args.terms}", file=sys.stderr)
        sys.exit(2)

    findings = []
    for i, line in enumerate(lines, 1):
        for term in terms:
            if term.lower() in line.lower():
                findings.append({
                    "id": f"S{len(findings)+1:03d}",
                    "location": {"file": args.file, "position": f"line {i}", "context": line.strip()},
                    "constraint": "forbidden-term",
                    "description": f"Forbidden term '{term}' found",
                    "evidence": f"'{term}' appears on line {i}"
                })

    result = {"script": "check_forbidden_terms", "findings": findings, "summary": {"total": len(findings), "checked": f"{len(terms)} terms against {len(lines)} lines"}}
    json.dump(result, sys.stdout, indent=2)
    print()

    sys.exit(1 if findings else 0)

if __name__ == "__main__":
    main()
```
