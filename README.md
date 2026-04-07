# Multi-Role Agent Skills

A collection of multi-role agent skills for [Claude Code](https://claude.ai/claude-code). Each skill decomposes a complex task into isolated roles — independent subagents with scoped visibility and fixed responsibilities — that coordinate through structured handoffs.

The core principle across all skills: **an agent that produced something cannot be an unbiased evaluator of that thing.** Role isolation prevents anchoring, scope creep, and self-assessment bias.

Built on ideas from:
- [Agentic Self-Correction](https://kurtiskemple.com/blog/agentic-self-correction/) — generate, validate, correct, repeat
- [Measuring Context Pollution](https://kurtiskemple.com/blog/measuring-context-pollution/) — detecting semantic drift from original intent
- [Context Management](https://kurtiskemple.com/blog/context-management-for-long-running-knowledge-extraction-systems/) — maintaining coherence over long-running workflows

## Skills

### Convergence Skills

A [self-correcting](https://kurtiskemple.com/blog/agentic-self-correction/) architecture where agents iteratively validate and improve an artifact until it achieves both structural validity and coherence for its audience. The base template has four roles — Orchestrator, Validator, Optimizer, Fixer. Skills may add domain-specific roles (e.g., blockkit-builder adds a Generator for interactive/auto Block Kit production).

Two agents assess the artifact in parallel from opposite directions: the **Validator** checks constraints (rules only, no domain knowledge), the **Optimizer** assesses fitness (domain and audience only, no rules). The **Orchestrator** merges both reports and resolves conflicts. The **Fixer** applies surgical corrections. The loop repeats until both lenses come back clean or the iteration bound is hit.

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

**Instances:**
- `math-verify/` — verifies mathematical correctness of journal papers against 23 constraints
- `blockkit-builder/` — builds and validates Slack Block Kit JSON (5 roles — adds Generator with interactive/auto modes)

**Tooling:**
- `create-convergence-skill/` — generates new convergence skills from an interview process; bundles the canonical template at `assets/template/`
- `scan-convergence-opportunities/` — surveys a project for artifacts that would benefit from convergence skills

### Complex Workflow

A five-role agent system (Orchestrator, Planner, Auditor, Executor, Drift Monitor) for planning and executing any complex multi-step task. Not a convergence skill — different architecture, different roles, different purpose.

The **Planner** locks in a detailed step-by-step plan with the user and is wiped after handoff. The **Executor** does the work. The **Auditor** judges every step against the plan before and after execution. The **Drift Monitor** measures [context pollution](https://kurtiskemple.com/blog/measuring-context-pollution/) — the semantic distance between the approved plan and the Orchestrator's accumulated state — and triggers [re-anchoring](https://kurtiskemple.com/blog/context-management-for-long-running-knowledge-extraction-systems/) when the Orchestrator drifts. The **Orchestrator** brokers all communication, owns all state, and is the only agent that decides whether to course correct, re-anchor, or escalate to the human.

## Key design decisions

**All roles are independent subagents.** The invoking agent never assumes any role. This prevents anchoring — an agent that produced the artifact can't be an unbiased validator.

**Scoped visibility.** Each agent sees only what it needs. Agents that assess from different lenses never see each other's reports. Agents that execute never see evaluation criteria.

**Per-finding confidence scoring.** Every finding carries two independent scores: issue confidence (is this a real problem) and fix confidence / correctability (is the proposed fix correct). The orchestrator uses both to decide what gets auto-approved, escalated, or dropped.

**Orchestrator-mediated communication.** No agent talks directly to another. The Orchestrator brokers all messages and filters what each agent sees.

**Gotchas grow from real runs.** Each skill maintains a gotchas file that accumulates operational intelligence — mistakes the agents make that get corrected.

## Creating your own convergence skill

The fastest path:

1. Install the `create-convergence-skill` skill
2. Describe your artifact, rules, and audience
3. Review the drafted constraints
4. The skill generates a complete, ready-to-run convergence skill

Or manually:

1. Copy `create-convergence-skill/assets/template/` to your skills directory and rename it
2. Fill in `references/constraints.md` with your structural rules
3. Fill in `references/domain.md` with your field knowledge
4. Fill in `references/context.md` with your audience and thresholds
5. Fill in `references/log-format.md` with your log directory and naming convention
6. Update `SKILL.md` frontmatter and pre-flight checks

## Requirements

- [Claude Code](https://claude.ai/claude-code) (CLI, desktop app, or IDE extension)
- Subagent support (the roles run as independent subagents)

## License

MIT
