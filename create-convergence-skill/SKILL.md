---
name: create-convergence-skill
description: "Create a self-correcting validation skill that iteratively improves an artifact through parallel validity and fitness checks. Use this skill when the user has a recurring artifact type — code, schemas, configs, documents, designs — that needs both structural rule compliance AND quality assessment for an audience. Trigger when someone wants to set up automated review for API schemas, database migrations, codebase audits, design system checks, documentation review, infrastructure configs, data pipeline validation, or any domain where both 'is it correct' and 'is it good' matter. Also trigger on phrases like 'set up a review process', 'create a validation workflow', 'I need automated checking for', or 'build a quality gate for'."
---

# Create Convergence Skill

This skill creates a new orchestrated multi-role adherence-coherence convergence skill — a self-correcting system where four independent agents (validator, orchestrator, fixer, optimizer) iteratively validate and improve an artifact until it achieves both adherence to structural constraints and coherence for its audience.

The output is a complete, ready-to-run skill directory.

## When to use this

The user has a recurring artifact type that benefits from both lenses:

- **Structural rules** the artifact must follow (spec compliance, security policies, style guides, formatting requirements) — things that are right or wrong
- **Quality for an audience** (readability, usability, performance, fitness for purpose) — things that require judgment

If both apply and the user will do this repeatedly, this skill fits. If only one lens applies (just formatting, just correctness), a simpler skill is better.

## The process

Follow the same rhythm as any skill creation: understand intent, interview for details, draft, present for review, generate. The difference is the output — instead of a generic skill, you produce a convergence skill with the four-agent architecture.

### Step 1: Understand the domain

Have a conversation with the user to understand their domain. Extract answers to these questions — not as a checklist, but from what they describe:

- **What's the artifact?** The thing they work on repeatedly (code files, config manifests, API schemas, design components, documents, data pipelines).
- **What are the structural rules?** Things that are definitively right or wrong — spec compliance, required fields, security policies, naming conventions, formatting requirements. These become the validator's constraints.
- **What makes it good for the audience?** Readability, coherence, usability, performance, clarity — things a reviewer would flag as "technically correct but not good." These become the optimizer's domain and context.
- **Who's the audience?** The people who receive or review the artifact — teammates, users, referees, compliance reviewers. Determines what "fit" means.
- **What goes wrong?** Common mistakes, recurring review feedback, known pitfalls. These seed the gotchas file.

People don't think in terms of "constraints" and "fitness." They think "what would my reviewer flag" or "what keeps breaking in code review." Extract the structure from their natural description.

### Step 2: Draft constraints — CHECKPOINT

Before generating anything, present the draft constraints to the user for review. This is the highest-leverage review point — if the constraints are wrong, the skill will converge on the wrong thing.

Separate what the user described into:

**Hard-reject constraints (C01, C02, ...):** Binary violations. The artifact is definitively wrong if these are present. No confidence scoring — it's wrong or it isn't.

**Scored constraints (C10, C11, ...):** Things that might be issues depending on context. Each needs:
- What constitutes a violation
- How to detect it
- **Confidence signals** — what makes issue confidence higher or lower for this specific constraint

Also draft:
- A **hard exclusion note** — what this skill does NOT check (to prevent the validator from overreaching into other skills' scope)
- The **pre-flight checks** — what must be true before the loop starts
- The **confidence rubric** — how mechanical vs judgment-based checks are weighted

Present all of this to the user. Wait for approval before generating.

### Step 3: Generate the skill

Read `references/architecture-overview.md` for context on the convergence architecture if you haven't already.

1. Copy the bundled template from `assets/template/` to `.claude/skills/<skill-name>/`
2. Update `SKILL.md` frontmatter: `name` (must match directory name, lowercase, hyphens only) and `description` (include trigger phrases specific to this domain)
3. Remove the instantiation checklist from `SKILL.md` (lines 10-21 of the template — it's scaffolding that doesn't belong in a real skill)
4. Replace the `<!-- DOMAIN: -->` pre-flight placeholder with domain-specific checks
5. Replace the `<!-- DOMAIN: -->` confidence rubric placeholder with domain-specific weighting
6. Fill in `references/constraints.md` — hard-reject and scored constraints with IDs, confidence signals, and the hard exclusion note
7. Fill in `references/domain.md` — field knowledge, quality signals, common patterns
8. Fill in `references/context.md` — audience, venue/target, thresholds, pipeline position
9. Seed `references/gotchas.md` with known pitfalls from the interview (or leave the template header if none yet)
10. Do NOT modify the agent files (`agents/*.md`) — they are generic by design. The role and responsibilities are template-level; only the reference files change per domain.

### Step 4: Validate

After generating, verify:
- [ ] All 11+ files exist in the output directory
- [ ] `SKILL.md` name field matches directory name exactly
- [ ] No `<!-- DOMAIN: -->` placeholders remain in `SKILL.md`
- [ ] No instantiation checklist remains in `SKILL.md`
- [ ] `constraints.md` has at least one hard-reject and one scored constraint
- [ ] `constraints.md` has a hard exclusion note at the bottom
- [ ] `domain.md` and `context.md` are filled in (not just template comments)
- [ ] Constraint IDs are sequential (C01, C02... for hard-reject; C10, C11... for scored)

Report what was generated: file list, constraint count, and a summary of the skill's scope.

### Step 5: Test (optional)

If the user has a sample artifact, offer to run the new skill against it as validation. This is the best way to find missing constraints, miscalibrated confidence, or gotchas.

## Gotchas

- The `name` field in SKILL.md frontmatter must match the directory name exactly — lowercase, hyphens only, no consecutive hyphens, no leading/trailing hyphens
- The instantiation checklist in the template SKILL.md must be removed after filling in — it's template scaffolding that confuses the agent when the skill runs
- The two `<!-- DOMAIN: -->` placeholders in SKILL.md (pre-flight and confidence rubric) are easy to miss — check for them explicitly during validation
- Constraint IDs must be consistent between constraints.md and any references in the confidence rubric — C06 in one must mean C06 in the other
- The hard exclusion note at the bottom of constraints.md is critical — without it, the validator will overreach into domains that belong to other skills (e.g., flagging grammar in a math-verify skill)
- Agent files should NOT be modified during instantiation — they define roles and responsibilities that are universal across all convergence skills. Domain-specific competencies come from the reference files.
- Cover letters or markdown files with Unicode math characters will break pandoc PDF generation — always use LaTeX inline math in any file that might be converted to PDF

## Progressive disclosure

- `references/architecture-overview.md` — read this to understand the convergence architecture before explaining it to the user or generating a skill
- `assets/template/` — the complete template directory; copy this to create a new skill
