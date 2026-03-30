# Guarded Validity-Fitness Convergence Skills

A [self-correcting](https://kurtiskemple.com/blog/agentic-self-correction/) skill architecture for [Claude Code](https://claude.ai/claude-code) where four independent agents — sweeper, guardian, fixer, optimizer — iteratively validate and improve an artifact until it satisfies both structural constraints and fitness for its audience.

## How it works

Two agents assess the artifact in parallel from opposite directions:

- **Sweeper** checks structural validity against explicit constraints. It sees rules only — not domain knowledge or audience context.
- **Optimizer** assesses fitness and coherence for the audience. It sees domain and context only — not structural rules.

A **Guardian** merges both reports, resolves conflicts between validity and fitness, and produces a fix report. A **Fixer** applies surgical corrections. The loop repeats until both lenses come back clean or the iteration bound is hit — at which point unresolved findings surface to the human.

The separation is the key insight: validity and fitness are orthogonal. An artifact can satisfy every rule and still be incoherent for its audience. It can be beautifully fit for purpose and structurally wrong. Both lenses applied independently and merged by a single adjudicator produce better results than either alone.

## What's in this repo

```
skills/
├── _template-guarded-validity-fitness-convergence/   # The architecture
├── create-convergence-skill/                          # Generates new skills from the template
├── math-verify/                                       # A real instance (mathematical paper verification)
└── scan-convergence-opportunities/                    # Discovers where to apply the architecture
```

### Template

The core architecture. Four agent files (sweeper, guardian, fixer, optimizer) define roles and responsibilities that don't change between domains. Three reference file templates (constraints, domain, context) get filled in per domain. Copy this directory and fill in the reference files to create a new convergence skill.

### Creator

A skill that generates new convergence skills through an interview process. It asks about your artifact, structural rules, quality dimensions, and audience — then produces a complete skill directory from the template. Modeled after the [skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator) pattern.

### Math Verify

A working instance that verifies mathematical correctness of journal papers. Demonstrates the architecture in action: the sweeper checks proof logic, notation consistency, and equation correctness against 26 constraints. The optimizer assesses logical chain coherence, proof architecture quality, and fitness for the target journal's audience. The guardian merges, the fixer corrects, and the loop converges.

### Scanner

Surveys a project and identifies artifacts that exhibit validity-fitness duality — where both structural rules and quality for an audience matter. Produces a report of opportunities with recommended convergence skills to create. Maintains a growing catalog of known patterns and can recognize structural isomorphisms in unfamiliar territory.

## The convergence loop

```
Guardian dispatches Sweeper + Optimizer (parallel)
  → Both produce identically structured findings reports
  → Guardian merges into single fix report
    → Fix report empty → done
    → Fix report has findings → Fixer works
      → Guardian dispatches Sweeper + Optimizer again
      → Repeat until clean or bound hit (default: 3 rounds)
      → Unresolved findings → surface to human as residual
```

## Key design decisions

**All roles are independent subagents.** The invoking agent never assumes any role. This prevents anchoring — an agent that produced the artifact can't be an unbiased sweeper.

**Sweeper and optimizer never see each other's reports.** Parallel dispatch prevents cross-contamination between the validity and fitness lenses.

**Per-finding confidence scoring.** Every finding carries two independent scores: issue confidence (is this a real problem) and fix confidence (is the proposed fix correct). The guardian uses both to decide what gets auto-approved, escalated, or dropped.

**Gotchas grow from real runs.** Each skill maintains a gotchas file that accumulates operational intelligence — mistakes the agents make that get corrected. The guardian proposes new gotchas after every run.

**The catalog grows from use.** The scanner's known patterns catalog expands when users confirm new convergence opportunities, making future scans smarter.

## Creating your own convergence skill

The fastest path:

1. Install the `create-convergence-skill` skill
2. Describe your artifact, rules, and audience
3. Review the drafted constraints
4. The skill generates a complete, ready-to-run convergence skill

Or manually:

1. Copy `_template-guarded-validity-fitness-convergence/` to your skills directory
2. Fill in `references/constraints.md` with your structural rules
3. Fill in `references/domain.md` with your field knowledge
4. Fill in `references/context.md` with your audience and thresholds
5. Update `SKILL.md` frontmatter and pre-flight checks

## Requirements

- [Claude Code](https://claude.ai/claude-code) (CLI, desktop app, or IDE extension)
- Subagent support (the four roles run as independent subagents)

## License

MIT
