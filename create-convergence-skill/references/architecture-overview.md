# Orchestrated Role-based Validity-Fitness Enforcement — Architecture Overview

Read this before explaining the architecture to a user or generating a convergence skill.

## The core idea

An artifact (code, document, schema, config) gets iteratively improved by four independent agents converging from opposite directions — structural validity and contextual fitness — through a single orchestrator that merges their perspectives and dispatches fixes.

## The four roles

**Orchestrator** — owns the process start to finish. Dispatches the other agents, receives their reports, merges findings into a single fix report, dispatches the fixer, tracks state across rounds, decides when the loop is done or when to surface unresolved findings to the human. Sees everything: constraints + domain + context.

**Validator** — detects structural constraint violations. Compares the artifact against explicit rules (the constraints) and reports what it finds. Cannot judge whether findings should be actioned — only reports. Sees constraints only. Does NOT see domain or context. Runs fresh each round (no memory of previous rounds).

**Optimizer** — assesses overall coherence, fitness, and quality for the audience. Evaluates whether the artifact works as a whole within its domain and context. Sees domain and context only. Does NOT see constraints. Runs fresh each round.

**Fixer** — the only agent that touches the artifact. Receives the orchestrator's fix report and makes surgical, minimal corrections. Sees the fix report and constraints only.

## The loop

```
Orchestrator dispatches Validator + Optimizer (parallel)
  → Both produce identically structured findings reports
  → Orchestrator merges into single fix report
    → Fix report empty → done
    → Fix report has findings → Fixer works
      → Orchestrator dispatches Validator + Optimizer again
      → Repeat until clean or bound hit (default: 3 rounds)
      → Unresolved findings → surface to human as residual
```

## Why validity and fitness are separated

The validator and optimizer are intentionally isolated from each other:

- **Validator sees constraints only** — so it can't self-censor findings based on "well, in this domain that's actually fine." A constraint violation is a constraint violation. The orchestrator (which sees both lenses) resolves whether it should be actioned.
- **Optimizer sees domain+context only** — so it can't anchor on rule compliance instead of quality. An artifact can satisfy every constraint and still be incoherent for its audience.
- **Neither sees the other's report** — preventing cross-contamination. Independent assessment from opposite directions produces richer signal for the orchestrator to merge.

## Confidence scoring

Every finding carries two independent scores:
- **Issue confidence** — how certain this is actually a problem (0.0–1.0)
- **Fix confidence** — how certain the proposed fix is correct (0.0–1.0)

The orchestrator uses these to decide:
- Auto-approve: issue >= 0.85 AND fix >= 0.85
- Escalate (issue without fix): issue >= 0.85 AND fix < 0.85
- Drop: issue < 0.60

## Key rules

1. All four roles must be spawned as independent subagents — the invoking agent never assumes any role itself
2. The orchestrator is the only agent that can end the skill or surface residual
3. The optimizer runs minimum once per invocation (guarantees fitness assessment even if the validator finds nothing)
4. The loop is bounded (default 3 rounds)
5. Recurring findings (same issue after being fixed) escalate to the human regardless of confidence
6. Only the orchestrator holds state across rounds — validator and optimizer are stateless

## The reference files

Each convergence skill has three domain-specific reference files:

| File | Purpose | Loaded by |
|------|---------|-----------|
| `constraints.md` | Structural rules (hard-reject + scored with confidence signals) | Validator, Orchestrator, Fixer |
| `domain.md` | Field knowledge, quality signals, norms | Optimizer, Orchestrator |
| `context.md` | Audience, venue, thresholds, pipeline position | Optimizer, Orchestrator |
| `gotchas.md` | Known pitfalls from previous runs | All agents |

The agent files (validator.md, orchestrator.md, fixer.md, optimizer.md) define roles and responsibilities and do NOT change between domains. Only the reference files change.
