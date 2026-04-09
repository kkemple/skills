---
name: complex-workflow
description: "Plan and execute complex multi-step tasks using a five-role agent system (Orchestrator, Planner, Auditor, Executor, Drift Monitor) with strict role isolation. Use this skill when the user has a complex, multi-step task that benefits from upfront planning and verified execution — refactors spanning multiple files, multi-stage deployments, data migrations, large feature implementations, or any workflow where steps depend on each other and mistakes compound. Trigger on phrases like 'plan this out', 'step by step', 'complex task', 'careful execution', 'verify each step', or when the task clearly has sequential dependencies and the cost of a wrong step is high."
---

# Complex Workflow

A multi-phase multi-role agent system for planning and executing any complex multi-step task. Five isolated agents — Orchestrator, Planner, Auditor, Executor, Drift Monitor — each with scoped visibility and fixed responsibilities, coordinate through structured handoffs to complete the task.

All five roles must be spawned as independent subagents. The invoking agent's only action is to spawn the Orchestrator subagent with the task description and the path to this skill, then relay the Orchestrator's final result to the user.

## Roles

Each role receives exactly the context listed in Sees and nothing else — the Orchestrator supplies the scope.

| Role | Responsibility | Sees |
|------|---------------|------|
| **Orchestrator** | Owns all state. Dispatches all agents. Maintains the task list. Brokers all communication. Decides whether to course correct, re-anchor, or escalate to human. Only agent that can end the process. | Everything — the plan, all Auditor reports, all task state, all execution history, Drift Monitor scores |
| **Planner** | Iterates with the user to produce a detailed step-by-step plan. Wiped after handoff. | User intent and the codebase. |
| **Auditor** | Judges every step against the plan — before and after execution. | The full approved plan and the Executor's execution plan and output for the current step. |
| **Executor** | Executes exactly what was approved. | The approved plan for the current step. |
| **Drift Monitor** | Measures semantic distance between the approved plan and the Orchestrator's current working state. Returns only the numeric context pollution score — output is the score and nothing accompanies it. | The approved plan (anchor) and the Orchestrator's current accumulated state summary. |

## Phases

### Phase 1: Plan — Planner

The Orchestrator launches the Planner. The Planner iterates with the user to lock in a detailed step-by-step plan with exact tool calls, file paths, commands, acceptance criteria, and validation protocols per step. The user must explicitly approve. The Planner saves the plan as JSON and is wiped.

### Phase 2: Task List Setup — Orchestrator

The Orchestrator reads the plan, creates a task per step (verbatim descriptions), and launches the Executor.

### Phase 3: Execute — Orchestrator brokers Executor ↔ Auditor

For each step: the Orchestrator dispatches the Executor to prepare an execution plan, passes it to the Auditor for pre-execution audit, loops until approved, tells the Executor to execute, passes the result to the Auditor for post-execution audit. After each completed step, the Orchestrator dispatches the Drift Monitor. All communication is Orchestrator-mediated.

### Phase 4: Error Recovery — Orchestrator decides

On Auditor deviation/error: the Orchestrator either course corrects the Executor (cascading task reset, fresh re-execution) or escalates to the human. Recurring failures on the same step always escalate. If replanning is needed, the Planner is relaunched from scratch.

### Drift Monitoring and Re-anchor

After each completed step and each course correction, the Drift Monitor measures context pollution (CP) — the semantic distance between the approved plan (anchor) and the Orchestrator's current working state.

- **< 0.10**: Aligned. Continue.
- **0.10–0.24**: Mild drift. Log, continue.
- **0.25–0.44**: Re-anchor. Orchestrator is wiped and respawned fresh from persisted state in `.claude/complex-workflow-workspace/tmp/` (plan.json, TaskList, auditor report files, completion-log.md for escalation history).
- **≥ 0.45**: Orchestrator is compromised. Escalate to human.

## Runtime workspace

All temp files (plan handoff, Auditor reports, completion log) are written to a workspace directory in the invoking project's current working directory:

```
.claude/complex-workflow-workspace/tmp/
```

**Scaffolding (run by the Orchestrator before any other work):**

1. Check if `.claude/` exists in the current working directory; if not, create it and record `created_claude_dir = true`. Otherwise `created_claude_dir = false`.
2. Check if `.claude/complex-workflow-workspace/` exists; if not, create it and record `created_workspace_dir = true`. Otherwise `created_workspace_dir = false`.
3. Check if `.claude/complex-workflow-workspace/tmp/` exists; if not, create it and record `created_tmp_dir = true`. Otherwise `created_tmp_dir = false`.
4. Hold these three creation flags in Orchestrator state for the entire run. They drive cleanup.

**Cleanup on successful completion (reverse-order teardown using the tracked flags):**

1. Delete every file inside `.claude/complex-workflow-workspace/tmp/` that this run created (plan.json, auditor reports, completion-log.md).
2. If `created_tmp_dir` is true, delete `.claude/complex-workflow-workspace/tmp/`.
3. If `created_workspace_dir` is true, delete `.claude/complex-workflow-workspace/`.
4. If `created_claude_dir` is true, delete `.claude/`.

**On failure** (escalation to human, unrecoverable error): skip cleanup entirely. Tell the user the workspace lives at `.claude/complex-workflow-workspace/tmp/` so they can inspect it.

## Templates

### Structured Step-by-Step Plan (Planner → Orchestrator)

```json
{
  "task_description": "what the user asked for",
  "total_steps": 5,
  "steps": [
    {
      "id": "S001",
      "description": "exact description of what this step does — this becomes the task subject verbatim",
      "tools": ["Read", "Edit"],
      "file_paths": ["path/to/file"],
      "commands": [],
      "reasoning": "why this step, why this order, why these tools",
      "acceptance_criteria": [
        "file exists at path/to/file",
        "file contains expected content X"
      ],
      "validation_protocol": "Read path/to/file and verify lines N-M contain X. If file was created, verify it is not empty. If content was edited, verify old content is gone and new content is present.",
      "depends_on": ["S000"]
    }
  ]
}
```

### Auditor Report (Auditor → Orchestrator)

```json
{
  "step_id": "S001",
  "evaluation_type": "pre_execution | post_execution",
  "status": "approved | deviation | error",
  "issue": {
    "type": "plan_deviation | implementation_error",
    "description": "what the issue is, stated precisely",
    "evidence": {
      "expected": "what the plan specified or what acceptance criteria required",
      "actual": "what the Executor proposed or produced",
      "diff": "exact difference between expected and actual"
    },
    "confidence": {
      "issue": 0.92,
      "correctability": 0.85
    }
  },
  "recommendation": "course_correct | escalate_to_human",
  "recommendation_rationale": "why this recommendation — what makes this fixable by course correction vs needing human judgment"
}
```

## Completion Log

The Orchestrator writes to `.claude/complex-workflow-workspace/tmp/completion-log.md` progressively — updating after each completed step, not only at the end. This serves two purposes: permanent record of the run for the duration of the run, and recovery state for re-anchor wipes. The log is removed by the cleanup step at the end of a successful run; on failure it stays for debugging.

The log includes:

- The original plan
- Every Auditor report (pre and post execution, every step)
- Every course correction
- Every escalation and the human's decision
- Drift Monitor scores per step
- Final outcome

Escalation decisions are written to the log as they happen. If the Orchestrator is wiped and respawned during re-anchor, the fresh Orchestrator reads the log to recover escalation history — policy decisions the human already made that must carry forward.

This is a permanent record — unsummarized, complete.

## Progressive Disclosure

| File | Purpose | Loaded by |
|------|---------|-----------|
| `agents/orchestrator.md` | Orchestrator role instructions | Orchestrator subagent |
| `agents/planner.md` | Planner role instructions | Planner subagent |
| `agents/executor.md` | Executor role instructions | Executor subagent |
| `agents/auditor.md` | Auditor role instructions | Auditor subagent |
| `agents/drift-monitor.md` | Drift Monitor role instructions | Drift Monitor subagent |
| `references/gotchas.md` | Known pitfalls from real runs | All agents |

