---
name: math-verify
description: "Verify mathematical correctness of a drafted journal paper using orchestrated validity-fitness convergence. Use this skill when the user wants to check proofs, validate logical steps, verify invoked results, audit notation consistency, or confirm that theorem hypotheses are necessary and sufficient. Trigger on phrases like 'verify the math', 'check the proofs', 'is this correct', 'audit the paper', 'mathematical review', or when a paper draft has just been completed and needs validation before copy editing."
---

# Mathematical Verification

## Ontology

### Core (universal, never changes)

| Term | Definition |
|------|-----------|
| **Artifact** | The thing being worked on. |
| **Finding** | Something detected in the artifact — a potential or confirmed violation of constraints (from validator) or a coherence/fitness issue (from optimizer). |
| **Fix** | A surgical change to the artifact at the finding level. |
| **Optimization** | A coherence or fitness improvement to the artifact at the whole level. |
| **Residual** | Findings the loop could not resolve. Surfaces to the human. |
| **Confidence** | Per-finding scores on two independent dimensions: issue confidence (is this a real problem) and fix confidence (is the proposed fix correct). |

### Roles

Each role has fixed responsibilities defined by the template. Domain-specific competencies are slotted in per instantiation.

| Role | Responsibility | Sees |
|------|---------------|------|
| **Orchestrator** | Orchestrates the entire process. Dispatches validator and optimizer. Receives their reports. Merges findings into a single fix report. Dispatches fixer. Holds state across rounds. Decides when the loop is done or when to surface residual. Starts and ends the skill. | Constraints + Domain + Context |
| **Validator** | Surfaces, catalogs, and assesses confidence of potential or confirmed constraint violations. Compares the artifact against constraints. Cannot judge whether findings should be actioned — only report. Runs on every round in parallel with optimizer. | Constraints only. Ignores domain and context. |
| **Optimizer** | Assesses the overall coherence, fitness, and quality of the artifact within its domain and context. Produces findings with fix suggestions. Runs on every round in parallel with validator, including when validator finds nothing — guaranteeing at least one complete loop. | Domain + Context only. Ignores constraints. |
| **Fixer** | Surgically applies fixes from the orchestrator's fix report. Uses minimal context: the fix report and the constraints. Makes the smallest change that resolves each finding. The only agent that touches the artifact. | Fix report + Constraints only. |

### Slotted per instantiation

| Term | Definition |
|------|-----------|
| **Domain** | The field the skill operates in. Determines what the validator's competencies are, what the optimizer evaluates for, and what the fixer needs to know. |
| **Context** | The specific situation — the journal, codebase, project, audience. Determines thresholds, confidence weighting, what counts as common knowledge. |
| **Constraints** | The rules that define valid. Defined by domain and context together. Classified as hard-reject (binary) or scored (confidence-weighted). The validator measures against these. The orchestrator enforces these. |

## Rules

These are the structural rules of the system. They govern how roles, constraints, findings, and the loop relate. A domain instantiation sets its own constraints, competencies, and thresholds — but it cannot change these rules.

1. All four roles must be spawned as independent subagents. The invoking agent (the one the user asked to run the skill) must never assume any role itself. The orchestrator, validator, optimizer, and fixer are each a separate subagent with no shared context beyond what the skill explicitly passes between them. **Why:** An agent that produced the artifact, or that has been in conversation with the user about it, cannot be an unbiased orchestrator or validator. Prior context creates anchoring — the agent already has opinions about what's right. Independence ensures the orchestrator evaluates findings on their merits against the constraint set, not through the lens of earlier decisions. The invoking agent's only job is to spawn the orchestrator subagent with the skill instructions and the artifact path, then relay results to the user.

2. The orchestrator owns the process. It starts the skill, dispatches agents, receives all reports, produces fix reports, holds state, and is the only agent that can end the skill or surface residual to the human. **Why:** A single orchestrator prevents race conditions, ensures consistent state, and gives the human one point of contact for the entire skill.

3. The validator's only responsibility is to surface, catalog, and assess confidence of potential or confirmed violations of constraints. It compares the artifact against constraints but cannot judge whether findings should be actioned — only report them. It sees constraints only. It does not see domain or context. **Why:** Separating detection from judgment prevents the validator from self-censoring findings based on domain conventions. A constraint violation is a constraint violation regardless of whether the domain considers it acceptable — the orchestrator resolves that tension with full context.

4. The optimizer's only responsibility is to assess the overall coherence, fitness, and quality of the artifact within its domain and context. It produces a findings report with fix suggestions. It sees domain and context only. It does not see constraints. **Why:** Separating fitness from validity prevents the optimizer from anchoring on rule compliance instead of quality. An artifact can satisfy every constraint and still be incoherent — the optimizer catches what rules can't express.

5. The validator and optimizer run in parallel every round. Both produce identically structured findings reports. Neither sees the other's report. Each looks at the artifact fresh with its own lens. **Why:** Parallel dispatch prevents cross-contamination between the validity and fitness lenses. If the validator saw the optimizer's report, it would anchor on fitness concerns and lose its strict constraint focus. If the optimizer saw the validator's report, it would anchor on violations and miss whole-artifact issues. Independent assessment from opposite directions produces richer signal for the orchestrator to merge.

6. The optimizer runs a minimum of once per skill invocation — even if the validator returns clean. **Why:** An artifact that satisfies all constraints may still be unfit for its audience. Guaranteeing one optimizer pass prevents the skill from terminating on structural validity alone without ever assessing fitness.

7. The orchestrator receives both reports, evaluates all findings, and merges them into a single fix report. The fix report is the only input the fixer receives. The orchestrator resolves conflicts between validator and optimizer findings. **Why:** The orchestrator is the only agent with the full picture (constraints + domain + context). Conflicts between validity and fitness — a validator finding that the optimizer would dismiss, or an optimizer finding that would violate a constraint — can only be resolved by an agent that sees both sides.

8. The fixer's only responsibility is to surgically apply fixes from the orchestrator's fix report. It uses minimal context: the fix report and the constraints. It makes the smallest change that resolves each finding. It is the only agent that touches the artifact. **Why:** Minimal context prevents the fixer from second-guessing the orchestrator's decisions or expanding scope beyond what was approved. Smallest-change discipline minimizes blast radius — each fix is isolated, and any interaction effects are caught by the validator on the next round.

9. If the orchestrator's merged fix report is empty (neither validator nor optimizer found anything actionable), the skill is done. **Why:** Empty fix report means the artifact satisfies constraints (validator clean) and is fit for purpose (optimizer clean). There is nothing left to improve within the skill's defined boundaries.

10. If the fix report has findings, the fixer works. After the fixer completes, the orchestrator dispatches validator and optimizer again in parallel for a fresh round against the modified artifact. **Why:** Fixes can introduce new issues or reveal issues that were masked by the original problems. A fresh parallel sweep on the modified artifact is the only way to verify convergence.

11. Confidence is scored per-finding with two independent dimensions: issue confidence and fix confidence. Weighting signals are domain-specific. **Why:** A finding can be certainly wrong but hard to fix (high issue, low fix) or easy to fix but uncertain (low issue, high fix). Scoring both dimensions independently lets the orchestrator make nuanced decisions — escalating real problems without confident fixes, dropping uncertain problems regardless of how easy they'd be to fix.

12. The loop is bounded. After N cycles (default: 3), unresolved findings become residual and surface to the human with full context. **Why:** Without bounds, a model correcting itself is an infinite loop. Diminishing returns set in quickly — if three rounds of validator/optimizer/fixer can't resolve a finding, it's likely a judgment call that requires human input.

13. Recurring findings — the same issue appearing after being fixed in a previous round — escalate to the human regardless of confidence. **Why:** A finding that survives its own fix is evidence that the fix was wrong or that the issue is structural. Continuing to auto-fix it wastes cycles. The human needs to see it.

14. No agent accumulates report context across rounds. Validator and optimizer look at the artifact and their respective lens (constraints or domain+context) fresh each time. Only the orchestrator holds history. **Why:** Stale context from previous rounds would bias detection. The validator might skip re-checking something it found before, assuming the fix landed. The optimizer might anchor on issues from round 1 instead of assessing the current artifact. Fresh assessment each round ensures findings reflect the artifact's actual state.

## The Loop

```
Orchestrator dispatches Validator + Optimizer (parallel)
  → Both produce findings reports (identical structure)
  → Orchestrator merges into single fix report
    → Fix report empty → done
    → Fix report has findings → Fixer works
      → Orchestrator dispatches Validator + Optimizer again (parallel)
      → Orchestrator merges new reports into fix report
        → Empty → done
        → Findings → Fixer works → loop
        → Bound hit → residual to human
```

## Pre-flight

Before entering the loop, the orchestrator verifies:

- [ ] `main.tex` exists in the paper directory and is a complete draft (no empty placeholder sections)
- [ ] `main.tex` compiles without errors (pdflatex pass)
- [ ] `references.bib` exists (even if incomplete — citation-sweep handles completeness)
- [ ] Source blog post available for cross-referencing derivations (optional but recommended)
- [ ] CLAUDE.md section available for cross-referencing key constants and identities (optional)

If pre-flight fails, stop and report what's missing. Do not enter the loop.

## Findings Report Format

Validator and optimizer produce identically structured reports:

```json
{
  "source": "validator | optimizer",
  "round": 1,
  "findings": [
    {
      "id": "F001",
      "location": {
        "file": "artifact file path",
        "position": "location within file",
        "context": "surrounding content for verification"
      },
      "description": "what the issue is, stated precisely",
      "evidence": "why this is an issue — the specific violation or degradation observed",
      "confidence": {
        "issue": 0.92,
        "fix": 0.85
      },
      "suggested_fix": {
        "old": "exact content to replace",
        "new": "exact replacement content",
        "rationale": "why this fix resolves the finding"
      }
    }
  ],
  "summary": {
    "total_findings": 0,
    "by_confidence": {
      "high": 0,
      "medium": 0,
      "low": 0
    }
  }
}
```

## Fix Report Format

The orchestrator produces a fix report for the fixer:

```json
{
  "round": 1,
  "fixes": [
    {
      "finding_id": "F001",
      "source": "validator | optimizer",
      "location": {
        "file": "artifact file path",
        "position": "location within file"
      },
      "description": "what to fix",
      "fix": {
        "old": "exact content to replace",
        "new": "exact replacement content"
      },
      "orchestrator_notes": "any adjustments the orchestrator made to the suggested fix"
    }
  ],
  "dropped": [
    {
      "finding_id": "F003",
      "source": "validator",
      "reason": "issue confidence below threshold (0.52)"
    }
  ],
  "escalated": [
    {
      "finding_id": "F007",
      "source": "optimizer",
      "reason": "issue confidence high (0.91) but fix confidence low (0.43) — surfacing issue without fix"
    }
  ]
}
```

## Residual Format

When the orchestrator surfaces residual to the human:

```markdown
## Residual — [N] rounds completed

### Unresolved findings
[For each unresolved finding:]
- **Source**: validator | optimizer
- **Location**: where in the artifact
- **Description**: what the issue is
- **Issue confidence**: X% — [why this score]
- **What was tried**: [fix attempts across rounds]
- **Why unresolved**: [specific reason]

### Round history
- Round 1: [N] findings from validator, [M] from optimizer, [K] fixed
- Round 2: [N] findings, [M] fixed
- Round N: [N] unresolved → surfaced
```

## Confidence Scoring

Every finding carries two independent scores:

- **Issue confidence** — how certain this is actually a problem
- **Fix confidence** — how certain the proposed fix is correct

Thresholds:
- Auto-approve: issue >= 0.85 AND fix >= 0.85
- Escalate issue only: issue >= 0.85 AND fix < 0.85
- Drop: issue < 0.60

Weighting for mathematical verification:
- Mechanical checks (C06 index balance, C23 dimensional consistency, C25 operator formatting): issue confidence 0.9+ — deterministic
- Proof logic (C01, C02, C04): issue confidence from independent re-derivation — high if the step genuinely fails, lower if ambiguous
- Convention checks (C24, C26): weight by how universal the convention is for the target journal
- Framework-level (C20-C22): medium weight — real concerns but involve more judgment

## Progressive Disclosure

The SKILL.md stays under 500 lines. Domain-specific detail lives in reference files. Each agent loads only what it needs.

### Agent files (role → responsibilities → competencies)

| File | Loads |
|------|-------|
| `agents/validator.md` | `references/constraints.md` |
| `agents/orchestrator.md` | `references/constraints.md` + `references/domain.md` + `references/context.md` |
| `agents/fixer.md` | `references/constraints.md` + (fix report from orchestrator) |
| `agents/optimizer.md` | `references/domain.md` + `references/context.md` |

### Reference files (slotted per instantiation)

| File | Purpose | Loaded by |
|------|---------|-----------|
| `references/constraints.md` | The rules that define valid. Hard-reject and scored constraints. | Validator, Orchestrator, Fixer |
| `references/domain.md` | The field. Quality signals, norms, conventions. | Optimizer, Orchestrator |
| `references/context.md` | The specific situation. Audience, venue, thresholds. | Optimizer, Orchestrator |
| `references/gotchas.md` | Mistakes agents will make without being told. Populated after real runs. | All agents |

### Other

- `scripts/` — bundled validation scripts returning structured JSON (see `scripts/README.md` for design pattern and example)
- `evals/` — test cases per skill-creator framework

## Template Directory Structure

```
<skill-name>/
├── SKILL.md                    # Loop orchestration, rules, ontology, report formats
├── agents/
│   ├── validator.md              # Role → responsibilities → competencies (constraints only)
│   ├── orchestrator.md             # Role → responsibilities → competencies (full picture)
│   ├── fixer.md                # Role → responsibilities → competencies (fix report + constraints)
│   └── optimizer.md            # Role → responsibilities → competencies (domain + context only)
├── scripts/                    # Bundled validation scripts returning structured JSON
│   └── (domain-specific)
├── references/                 # Domain knowledge loaded on demand
│   └── (domain-specific)
└── evals/                      # Test cases per skill-creator framework
    └── evals.json
```
