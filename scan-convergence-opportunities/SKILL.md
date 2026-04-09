---
name: scan-convergence-opportunities
description: "Scan a project to identify artifacts that would benefit from self-correcting validation — where both structural rules and quality for an audience matter. Use this skill when the user wants to understand where automated review would help, is setting up quality processes, onboarding onto a new project, or asks things like 'what should I validate', 'where are my quality gaps', 'what needs automated review', or 'help me set up quality checks'. Also trigger when someone just learned about convergence skills and wants to know where to apply them."
---

# Scan for Convergence Opportunities

Survey a project and identify artifacts that exhibit adherence-coherence duality — both structural rules that can be checked mechanically AND a quality dimension that requires judgment about fitness for an audience. Produce a report of opportunities, teach the user to recognize the pattern, and grow the catalog from what you find.

## The structural signature

An artifact is a convergence candidate when all four conditions hold:

1. **It has constraints that can be checked mechanically** — structural rules, specs, schemas, type systems, policies, formatting requirements
2. **It has a quality dimension that requires judgment** — readability, design consistency, developer experience, operational clarity, fitness for the people who receive it
3. **It recurs** — the user works on this artifact type regularly, not once
4. **Both lenses add value** — existing tooling (linters, CI, type checkers) doesn't already cover both dimensions

If only one dimension applies (just formatting, just correctness), a simpler tool is a better fit. Convergence skills are for the intersection.

## Process

### Step 1: Survey the project

Read the project from root. Look for signals in these categories:

- **Config files** that encode structural rules — linter configs, type configs, schema files, CI workflows, security policies, `.editorconfig`, Docker configs
- **Schema files** that define artifact structure — OpenAPI specs, GraphQL schemas, database migrations, Prisma schemas, protobuf definitions, JSON schemas
- **Documentation** that encodes quality expectations — README, CONTRIBUTING, ADRs, style guides, review checklists, onboarding docs
- **Code patterns** that reveal team conventions — test structure, component organization, module patterns, naming conventions, directory layout
- **CI/CD** that shows what's already automated — and what gaps exist between what's checked and what matters
- **Review artifacts** that reveal the audience — PR templates, CODEOWNERS, review checklists, issue templates

Read `references/known-patterns.md` before surveying — it contains the catalog of known convergence patterns with their characteristic validity and fitness dimensions.

### Step 2: Match against known patterns

For each artifact type found, check against the known patterns catalog. If a match exists, note the characteristic validity and fitness dimensions from the catalog. Adapt them to what you actually see in this project — the catalog provides the shape, the project provides the specifics.

### Step 3: Look for structural isomorphisms

For artifacts not in the catalog, read `references/structural-signature.md` and apply the four-condition test. Anything with mechanically checkable rules AND a judgment-based quality dimension for a specific audience, recurring regularly, is a candidate — even if nobody's cataloged it before.

### Step 4: Assess existing coverage

For each candidate, identify what's already automated:
- **Linters, formatters, type checkers** — cover some validity but rarely fitness
- **CI checks** — enforce some constraints but usually miss quality
- **Manual review processes** — cover fitness but are inconsistent and don't scale

The gap between what's enforced and what matters is where a convergence skill adds value. If existing tooling already covers both dimensions well, report the artifact as already covered and describe which tools handle which dimension.

### Step 5: Produce the report

For each convergence opportunity:

```markdown
### [Artifact type]

**What it is:** [description of the artifact in this project]

**Validity dimension:** [structural rules — what a validator would check]
- [specific rules inferred from configs/schemas/CI]

**Fitness dimension:** [quality for audience — what an optimizer would assess]
- [specific quality criteria inferred from docs/conventions/review patterns]

**Audience:** [who reviews or consumes this]

**Existing coverage:** [what's already automated]

**Gap:** [what a convergence skill would add that doesn't exist]

**Priority:** high | medium | low
**Recommended skill name:** [ready for create-convergence-skill]
```

Be conservative. Only report opportunities where the convergence architecture genuinely adds value over what exists.

### Step 6: Teach the pattern

After the report, briefly explain the structural signature so the user can recognize it themselves: "These opportunities share a common shape — an artifact with both mechanical rules and a quality dimension for a specific audience. If you notice this pattern in other parts of your project or in future work, that's also a convergence candidate."

The goal is to transfer the pattern so the user can recognize convergence candidates themselves in future work.

### Step 7: Grow the catalog

For any new patterns discovered through structural isomorphism (Step 3), ask: "I found [artifact type] matches the convergence pattern but isn't in my known examples yet. Want me to add it to the catalog for future scans?"

If the user says yes, append the new pattern to `references/known-patterns.md` with its characteristic validity and fitness dimensions.

### Step 8: Handoff

If the user wants to create a convergence skill for any reported opportunity, hand off to `create-convergence-skill` with the identified constraints, domain, context, and gotchas pre-populated from what the scan found.

## Progressive disclosure

- `references/known-patterns.md` — the living catalog of known convergence patterns. Read before surveying.
- `references/structural-signature.md` — the abstract pattern for recognizing new candidates not in the catalog.
