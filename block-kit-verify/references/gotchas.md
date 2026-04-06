# Gotchas — Block Kit Verification

Loaded by: All agents

Populate this file after every real run where an agent gets something wrong. These are seeded from known domain pitfalls.

### "Held" findings must resolve at loop termination
**What the agent assumes:** Findings with issue confidence between 0.60 and 0.85 can remain "held" in the final report, presented as a middle state between dropped and escalated.
**What's actually true:** "Held" is a between-rounds state only. It means "carry forward to see if it recurs." When the loop terminates — whether clean, at bound, or because the fix report is empty — every held finding must be resolved: either drop it (confidence didn't increase, not recurring) or escalate it (recurred or confidence rose). A final report with "held" findings is incoherent — it presents issues with no resolution path and forces the human to do triage the skill should have completed.
**Which agents this affects:** orchestrator

### Don't flag preferences the target venue doesn't require
**What the agent assumes:** Scored constraints apply universally and should be reported whenever violated.
**What's actually true:** Scored constraints are weighted by venue/audience convention. If the target venue does not require or conventionally use a practice, the finding's issue confidence should be below the drop threshold (< 0.60). The optimizer should not surface preferences that the target venue does not enforce.
**Which agents this affects:** optimizer, orchestrator

### Don't flag implicit steps that are immediate for the target audience
**What the agent assumes:** If an artifact doesn't explicitly state every intermediate step, it has a gap worth reporting.
**What's actually true:** A gap is only a finding if the missing step is non-obvious to the target audience. Standard steps that readers of the target venue can fill in immediately are not findings. Reporting these wastes the human's time on triage the validator should have resolved by scoring issue confidence below 0.60.
**Which agents this affects:** validator, orchestrator
