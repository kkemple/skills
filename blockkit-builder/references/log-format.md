# Orchestrator Completion Report Logging

## Where logs go

```
logs/YYYY-MM-DD/NNN-blockkit-builder--<artifact-slug>.md
```

- `YYYY-MM-DD` — date of the run
- `NNN` — 3-digit sequence number within the day (001, 002, ...)
- `<artifact-slug>` — lowercase, hyphenated name derived from the artifact filename (e.g., `approval-modal`, `deploy-notification`)

Create the directory if it doesn't exist. Increment the sequence number based on existing files in the day's directory.

## What gets logged

The full orchestrator completion report with no summarization or omission:

1. **Invocation metadata** — mode (generate/verify, interactive/auto), artifact path, surface, timestamp
2. **Generation summary** (if applicable) — mode, block count, types used, assumptions
3. **All findings table** — every finding from every round, every disposition (approved, dropped, held→resolved, escalated)
4. **Changes applied** — each fix with round, finding ID, location, old→new, source
5. **Dropped findings with reasons** — including those resolved from held at termination
6. **Escalated findings** — issue and fix confidence, escalation reason
7. **Residual** (if any) — full detail per SKILL.md residual format
8. **Proposed gotchas** — what was proposed, whether accepted/edited/dismissed

## When it's written

The orchestrator writes the log as its final action before returning the completion report to the spawning agent. The log is written regardless of outcome — clean runs, runs with residual, and runs that failed post-generation pre-flight all get logged.
