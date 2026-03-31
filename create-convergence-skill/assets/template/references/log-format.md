# Orchestrator Completion Report Logging

<!-- DOMAIN: Replace with your project's logging setup -->

The orchestrator's completion report should be persisted as a permanent audit record. When instantiating this template, define:

1. **Where logs go** — a directory structure and naming convention for your project
2. **What gets logged** — at minimum, the full orchestrator completion report (findings table, changes applied, held/escalated/residual, proposed gotchas). No summarization, no omission.
3. **When it's written** — the orchestrator writes the log as its final action before returning the report to the spawning agent

Observability is what makes the convergence loop improvable. Without logs, you can't trace what the system did, why findings were dropped, or where gotchas should be added. Add logging before your first real run.
