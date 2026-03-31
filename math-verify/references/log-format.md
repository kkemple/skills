# Orchestrator Completion Report Logging

The orchestrator's completion report (the full report returned to the spawning agent) must also be written to the log directory.

## Logging instructions

1. Get today's date as `YYYY-MM-DD`
2. Create `papers/logs/YYYY-MM-DD/` if it doesn't exist
3. Count existing files in that directory to determine the next sequence number `NNN` (zero-padded to 3 digits: 001, 002, etc.)
4. Derive `<paper-slug>` from the paper title: lowercase, spaces to dashes, drop special characters
5. Write the orchestrator's full completion report to `papers/logs/YYYY-MM-DD/NNN-<skill-name>--<paper-slug>.md`

The `<skill-name>` is the skill that was invoked (e.g., `math-verify`, `copy-edit`, `citation-sweep`).

## What gets logged

The exact completion report the orchestrator produces — no summarization, no omission. This includes:

- Full findings table (every finding, every round, every disposition with confidence scores)
- Changes applied (every fix with old→new)
- Held findings
- Escalated findings
- Residual (if any)
- Proposed gotchas

The log file is a permanent record. The orchestrator writes it as its final action before returning the report to the spawning agent.
