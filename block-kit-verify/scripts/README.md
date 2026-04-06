# Scripts

Bundled validation scripts that return structured JSON. The validator and orchestrator can invoke these as part of their checks for deterministic, programmatically verifiable constraints.

## Design principles

Scripts in this directory follow agentic use patterns:

1. **No interactive prompts.** Agents run in non-interactive shells. Accept all input via command-line flags or stdin.

2. **`--help` documents the interface.** The agent reads `--help` to learn flags, expected inputs, and usage examples. Keep it concise — it enters the agent's context.

3. **Structured JSON to stdout.** Output findings as JSON matching the findings report format in SKILL.md. This lets the validator incorporate script output directly into its report.

4. **Diagnostics to stderr.** Progress messages, warnings, and debug info go to stderr so stdout stays parseable.

5. **Meaningful error messages.** "Error: invalid input" wastes a turn. "Error: --file expects a .json path, received 'main.pdf'" gives the agent what it needs to self-correct.

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

The validator incorporates script findings into its report, adding confidence scores based on the constraint type (script-verified findings from deterministic checks typically get high issue confidence).
