# Structural Signature

How to recognize a convergence candidate that isn't in the known patterns catalog.

## The test

Apply these four conditions. All four must hold.

**1. Mechanical constraints exist.**
The artifact has rules that can be checked without judgment — type correctness, required fields, format compliance, policy adherence, spec conformance. These don't require understanding the audience or the domain's quality norms. They're right or wrong.

Look for: linter configs, schema definitions, type systems, CI checks, policy documents, validation rules, format specifications.

**2. A quality dimension exists that requires judgment.**
Beyond mechanical correctness, there's a "good vs not good" dimension that depends on who's receiving the artifact and what they need. Two artifacts can both be structurally correct but one is clearly better for the audience.

Look for: style guides, review checklists, design principles, "best practices" documents, recurring review feedback themes, team conventions that aren't codified in linters.

**3. The artifact recurs.**
The user creates or modifies this artifact type regularly. A one-off artifact doesn't justify a convergence skill — the setup cost exceeds the value. Regular recurrence means the skill pays for itself quickly.

Look for: directories with many instances of the same type, version-controlled files that change frequently, templates that get copied and filled in.

**4. Both lenses add value beyond existing tooling.**
If linters already catch every structural issue and code review already ensures quality, a convergence skill adds overhead without value. The opportunity is in the gap — structural rules that aren't enforced mechanically, quality dimensions that aren't assessed consistently.

Look for: the gap between what CI checks and what reviewers catch, between what's automated and what matters.

## How to describe a new pattern

When you find something that passes all four conditions, describe it the same way the known patterns are structured:

- **Artifact type** — what it is
- **Validity** — the mechanical constraints (what the sweeper would check)
- **Fitness** — the quality dimension (what the optimizer would assess)
- **Audience** — who receives or reviews the artifact

This description becomes the catalog entry if the user wants to add it.

## What disqualifies a candidate

- Only one dimension applies (just formatting → use a formatter; just correctness → use a linter)
- The artifact is one-off (setup cost exceeds value)
- Existing tooling already covers both dimensions well (acknowledge what's working)
- The quality dimension is purely subjective with no audience to calibrate against (art, personal preferences)
