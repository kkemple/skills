# Orchestrator Completion Report Logging

## Where logs go

```
.claude/blockkit-builder-workspace/logs/<YYYY-MM-DD>-<HHMMSS>-<surface>.md
```

The workspace directory is scaffolded by the orchestrator at the start of the run. The `logs/` subdirectory is created on first write if it does not yet exist. Logs are permanent — they survive cleanup and accumulate across runs so future invocations (and the gotcha review) have a record of what happened. Use the surface (`message`, `home`, `modal`) in the filename so logs are easy to scan by surface.

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

The orchestrator writes the log immediately before the Output handoff step. The log is permanent on both successful and failed runs — it is never removed by Cleanup. On failure the rest of the workspace is also left in place for debugging.
