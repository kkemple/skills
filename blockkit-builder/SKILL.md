---
name: blockkit-builder
description: "Build and validate Slack Block Kit JSON using orchestrated multi-role adherence-coherence convergence. Use this skill when the user wants to build Block Kit layouts, generate block structures, create element compositions, construct surface-specific UIs, validate existing Block Kit JSON, or improve Block Kit payloads. Trigger on phrases like 'build blocks', 'build Block Kit', 'create this layout', 'make Block Kit JSON', 'build my Slack message blocks', 'check my Block Kit', 'validate this layout', 'improve this Block Kit', or when Block Kit JSON needs to be generated from a description or validated for correctness."
---

# Block Kit Builder

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
| **Orchestrator** | Orchestrates the entire process. Dispatches generator (if needed), validator, and optimizer. Receives their reports. Merges findings into a single fix report. Dispatches fixer. Holds state across rounds. Decides when the loop is done or when to surface residual. Starts and ends the skill. | Constraints + Domain + Context + Gotchas |
| **Generator** | First agent launched in generation mode. Interactive: interviews user about intent and goals, proposes a UI plan, iterates until confirmed, produces Block Kit JSON. Auto: analyzes input directly and produces JSON without user interaction. Runs once before the convergence loop. Does not participate in the loop. | Constraints + Domain + Context + Generation Guide + Examples + Gotchas |
| **Validator** | Surfaces, catalogs, and assesses confidence of potential or confirmed constraint violations. Reports findings with confidence scores. The orchestrator decides what is actioned. Runs on every round in parallel with optimizer. | Constraints and gotchas. |
| **Optimizer** | Assesses the overall coherence, fitness, and quality of the artifact within its domain and context. Produces findings with fix suggestions. Runs on every round in parallel with validator, including when validator finds nothing — guaranteeing at least one complete loop. | Examples, domain, context, and gotchas. |
| **Fixer** | Surgically applies fixes from the orchestrator's fix report. Uses minimal context: the fix report and the constraints. Makes the smallest change that resolves each finding. The only agent that touches the artifact during the loop. | Fix report + Constraints + Gotchas only. |

### Slotted per instantiation

| Term | Definition |
|------|-----------|
| **Domain** | The field the skill operates in. Determines what the validator's competencies are, what the optimizer evaluates for, and what the fixer needs to know. |
| **Context** | The specific situation — the journal, codebase, project, audience. Determines thresholds, confidence weighting, what counts as common knowledge. |
| **Constraints** | The rules that define valid. Defined by domain and context together. Classified as hard-reject (binary) or scored (confidence-weighted). The validator measures against these. The orchestrator enforces these. |

## Rules

These are the structural rules of the system. They govern how roles, constraints, findings, and the loop relate. A domain instantiation sets its own constraints, competencies, and thresholds — but it cannot change these rules.

1. All roles must be spawned as independent subagents. The orchestrator, generator, validator, optimizer, and fixer are each a separate subagent with no shared context beyond what the skill explicitly passes between them. The invoking agent's only job is to spawn the orchestrator subagent with the skill instructions and the artifact path (or description), then relay results to the user. **Why:** An agent that produced the artifact, or that has been in conversation with the user about it, cannot be an unbiased orchestrator or validator. Prior context creates anchoring — the agent already has opinions about what's right. Independence ensures the orchestrator evaluates findings on their merits against the constraint set, not through the lens of earlier decisions.

2. The orchestrator owns the process. It starts the skill, dispatches agents, receives all reports, produces fix reports, holds state, and is the only agent that can end the skill or surface residual to the human. **Why:** A single orchestrator prevents race conditions, ensures consistent state, and gives the human one point of contact for the entire skill.

3. The validator's only responsibility is to surface, catalog, and assess confidence of potential or confirmed violations of constraints. It reports findings with confidence scores. The orchestrator decides what is actioned. It sees constraints and gotchas. **Why:** Separating detection from judgment prevents the validator from self-censoring findings based on domain conventions. A constraint violation is a constraint violation regardless of whether the domain considers it acceptable — the orchestrator resolves that tension with full context.

4. The optimizer's only responsibility is to assess the overall coherence, fitness, and quality of the artifact within its domain and context. It produces a findings report with fix suggestions. It sees examples, domain, context, and gotchas. **Why:** Separating fitness from validity lets the optimizer focus purely on whether the artifact is coherent, fit, and high-quality for its audience. An artifact can satisfy every constraint and still be incoherent — the optimizer catches what rules can't express.

5. The validator and optimizer run in parallel every round, each dispatched independently by the orchestrator with only its own lens (constraints / domain+context) and the artifact. Both produce identically structured findings reports. **Why:** Independent parallel assessment keeps each lens pure — the validator stays strictly on constraints, the optimizer stays strictly on whole-artifact fitness — producing richer signal for the orchestrator to merge.

6. The optimizer runs a minimum of once per skill invocation — even if the validator returns clean. **Why:** An artifact that satisfies all constraints may still be unfit for its audience. Guaranteeing one optimizer pass prevents the skill from terminating on structural validity alone without ever assessing fitness.

7. The orchestrator receives both reports, evaluates all findings, and merges them into a single fix report. The fix report is the only input the fixer receives. The orchestrator resolves conflicts between validator and optimizer findings. **Why:** The orchestrator is the only agent with the full picture (constraints + domain + context). Conflicts between validity and fitness — a validator finding that the optimizer would dismiss, or an optimizer finding that would violate a constraint — can only be resolved by an agent that sees both sides.

8. The fixer's only responsibility is to surgically apply fixes from the orchestrator's fix report. It uses minimal context: the fix report and the constraints. It makes the smallest change that resolves each finding. It is the only agent that touches the artifact during the convergence loop. (The generator writes the artifact before the loop begins, if applicable.) **Why:** Minimal context keeps the fixer focused on applying the approved fix report verbatim and making the smallest change that resolves each finding. Each fix is isolated, and any interaction effects are caught by the validator on the next round.

9. If the orchestrator's merged fix report is empty (neither validator nor optimizer found anything actionable), the skill is done. **Why:** Empty fix report means the artifact satisfies constraints (validator clean) and is fit for purpose (optimizer clean). There is nothing left to improve within the skill's defined boundaries.

10. If the fix report has findings, the fixer works. After the fixer completes, the orchestrator dispatches validator and optimizer again in parallel for a fresh round against the modified artifact. **Why:** Fixes can introduce new issues or reveal issues that were masked by the original problems. A fresh parallel sweep on the modified artifact is the only way to verify convergence.

11. Confidence is scored per-finding with two independent dimensions: issue confidence and fix confidence. Weighting signals are domain-specific. **Why:** A finding can be certainly wrong but hard to fix (high issue, low fix) or easy to fix but uncertain (low issue, high fix). Scoring both dimensions independently lets the orchestrator make nuanced decisions — escalating real problems without confident fixes, dropping uncertain problems regardless of how easy they'd be to fix.

12. The loop is bounded. After N cycles (default: 3), unresolved findings become residual and surface to the human with full context. **Why:** Without bounds, a model correcting itself is an infinite loop. Diminishing returns set in quickly — if three rounds of validator/optimizer/fixer can't resolve a finding, it's likely a judgment call that requires human input.

13. Recurring findings — the same issue appearing after being fixed in a previous round — escalate to the human regardless of confidence. **Why:** A finding that survives its own fix is evidence that the fix was wrong or that the issue is structural. Continuing to auto-fix it wastes cycles. The human needs to see it.

14. No agent accumulates report context across rounds. Validator and optimizer look at the artifact and their respective lens (constraints or domain+context) fresh each time. Only the orchestrator holds history. **Why:** Fresh assessment each round ensures findings reflect the artifact's actual current state.

15. When the skill is invoked in generation mode, the orchestrator dispatches the Generator as the first agent. The Generator operates in interactive mode (interviews user, proposes UI plan, iterates until confirmed, produces JSON) or auto mode (analyzes input directly, produces JSON without user interaction). The Generator runs exactly once, before the convergence loop begins. **Why:** Generation is a production task, not an evaluation task. The convergence loop evaluates and fixes. One generation pass followed by bounded convergence ensures termination. The interactive/auto split exists because the skill serves two consumers: humans who need help figuring out what to build, and LLMs or scripts that already know what they need.

## The Loop

```
[Generation mode:]
  Orchestrator dispatches Generator (interactive or auto)
    → Interactive: Generator interviews user → proposes UI plan → user confirms → produces JSON
    → Auto: Generator analyzes input → produces JSON directly
    → Orchestrator verifies artifact (post-generation pre-flight)
      → Fails → stop and report
      → Passes → enter convergence loop below

[Convergence loop:]
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

### Workspace setup

Before pre-flight checks, the orchestrator scaffolds the workspace and tracks what it created so cleanup can tear down only what this run added:

- [ ] Check if `.claude/` exists in the current working directory; if not, create it and record `created_claude_dir = true`
- [ ] Check if `.claude/blockkit-builder-workspace/` exists; if not, create it and record `created_workspace_dir = true`
- [ ] Check if `.claude/blockkit-builder-workspace/tmp/` exists; if not, create it and record `created_tmp_dir = true`
- [ ] Hold the three creation flags in orchestrator state for the entire run

The workspace is created in the current working directory of the project where the skill is invoked.

### Mode A: Existing artifact

The user provided a path to an existing Block Kit JSON file.

- [ ] Block Kit JSON file exists at the specified path
- [ ] File contains valid, parseable JSON
- [ ] JSON contains a `blocks` array (top-level or within a recognized structure)
- [ ] Target surface is specified or inferable (message, modal, or Home tab)

If pre-flight passes, proceed to the convergence loop.

### Mode B: Generate

The user wants Block Kit JSON produced, not an existing file verified.

- [ ] User provided a description, requirement, or input data
- [ ] Generation mode determined: interactive (default — user wants help) or auto (input is clear, or invoked by another LLM)
- [ ] Orchestrator dispatches Generator → artifact produced at `.claude/blockkit-builder-workspace/tmp/artifact.json` → post-generation pre-flight (same checks as Mode A)

If pre-flight fails in either mode, stop and report what's missing.

## Output handoff

After the convergence loop terminates successfully, before cleanup:

1. The orchestrator reads the final artifact at `.claude/blockkit-builder-workspace/tmp/artifact.json`
2. Prints the full JSON to chat in a fenced ```json code block so the user can copy it directly
3. Asks the user whether to (a) copy from chat or (b) write to a file path the user specifies
4. If the user chooses (b), writes the artifact to that path
5. Once the user has the JSON in hand, proceeds to cleanup

## Cleanup

The very last action on successful completion. Tears down only what this run created, in reverse order using the tracked flags from workspace setup:

1. Delete every file inside `.claude/blockkit-builder-workspace/tmp/` that this run created (`artifact.json`, etc.). The completion report in `.claude/blockkit-builder-workspace/logs/` persists across runs — cleanup only touches files this run created.
2. If `created_tmp_dir` is true, delete `.claude/blockkit-builder-workspace/tmp/`
3. If `created_workspace_dir` is true, delete `.claude/blockkit-builder-workspace/`
4. If `created_claude_dir` is true, delete `.claude/`

**On failure** (residual surfaced, post-generation pre-flight failed, or any unrecoverable error): skip cleanup entirely. Tell the user the workspace lives at `.claude/blockkit-builder-workspace/tmp/` so they can inspect it.

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
- Hold: 0.60 <= issue < 0.85. Carry forward to next round. If recurring, escalate.
- Drop: issue < 0.60


## Progressive Disclosure

The SKILL.md stays under 500 lines. Domain-specific detail lives in reference files. Each agent loads only what it needs.

### Agent files (role → responsibilities → competencies)

| File | Loads |
|------|-------|
| `agents/generator.md` | `references/generation-guide.md` + `references/examples.md` + `references/constraints/core.md` + (matching block/element constraints) + `references/domain.md` + `references/context.md` + `references/gotchas.md` |
| `agents/validator.md` | `references/constraints/core.md` + (matching block/element constraints) + `references/gotchas.md` |
| `agents/orchestrator.md` | `references/constraints/core.md` + (matching block/element constraints) + `references/domain.md` + `references/context.md` + `references/gotchas.md` + `references/log-format.md` |
| `agents/fixer.md` | `references/constraints/core.md` + (matching block/element constraints) + (fix report from orchestrator) + `references/gotchas.md` |
| `agents/optimizer.md` | `references/examples.md` + `references/domain.md` + `references/context.md` + `references/gotchas.md` |

### Reference files (slotted per instantiation)

| File | Purpose | Loaded by |
|------|---------|-----------|
| `references/constraints/` | The rules that define valid. `core.md` for universal constraints, `blocks/` and `elements/` for type-specific hard-reject and scored constraints. | Validator, Orchestrator, Fixer, Generator |
| `references/domain.md` | The field. Quality signals, norms, conventions. | Optimizer, Orchestrator, Generator |
| `references/context.md` | The specific situation. Audience, venue, thresholds. | Optimizer, Orchestrator, Generator |
| `references/generation-guide.md` | Production patterns, surface scaffolds, description-to-blocks mapping. | Generator |
| `references/examples.md` | Coherence patterns distilled from real Block Kit examples. What "good" looks like. | Optimizer, Generator |
| `references/log-format.md` | Completion report logging spec. Directory structure, naming, content. | Orchestrator |
| `references/gotchas.md` | Mistakes agents will make without being told. Populated after real runs. | All agents |

### Other

- `scripts/` — bundled validation scripts returning structured JSON (see `scripts/README.md` for design pattern and example)
- `evals/` — test cases per skill-creator framework

## Template Directory Structure

```
blockkit-builder/
├── SKILL.md                    # Loop orchestration, rules, ontology, report formats
├── agents/
│   ├── generator.md              # Role → responsibilities → competencies (pre-loop production)
│   ├── validator.md              # Role → responsibilities → competencies (constraints only)
│   ├── orchestrator.md           # Role → responsibilities → competencies (full picture)
│   ├── fixer.md                  # Role → responsibilities → competencies (fix report + constraints)
│   └── optimizer.md              # Role → responsibilities → competencies (domain + context only)
├── scripts/
│   ├── README.md                 # Design pattern for validation scripts
│   └── validate-json.sh          # Structural JSON validation (C01-C04)
├── references/
│   ├── constraints/
│   │   ├── core.md               # Universal constraints (C01-C10)
│   │   ├── blocks/               # Per-block-type constraints (15 files)
│   │   └── elements/             # Per-element-type constraints (20 files)
│   ├── domain.md                 # Block Kit design field knowledge
│   ├── context.md                # Audience, venue, thresholds
│   ├── examples.md               # Coherence patterns from real Block Kit examples
│   ├── generation-guide.md       # Production patterns, interview protocol
│   ├── gotchas.md                # Known pitfalls from real runs
│   └── log-format.md             # Completion report logging spec
├── assets/
│   └── blockkit-examples/        # Real-world Block Kit JSON examples (19 files)
└── evals/
    ├── evals.json                # Test case definitions
    └── fixtures/                 # Test artifact files
```

**Runtime workspace** (created in the invoking project):

```
<invoking-project>/
└── .claude/
    └── blockkit-builder-workspace/
        ├── tmp/
        │   └── artifact.json         # The Block Kit JSON being built/validated (deleted on success)
        └── logs/
            └── <YYYY-MM-DD>-<HHMMSS>-<surface>.md  # Permanent completion report (survives cleanup)
```

The orchestrator scaffolds this workspace at the start of each run. On successful completion it tears down the `tmp/` artifacts but leaves `logs/` intact so completion reports accumulate across runs (see Pre-flight → Workspace setup, the Write log step, and the Cleanup section).
