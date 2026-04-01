# Gotchas — Mathematical Verification

Loaded by: All agents

Populate this file after every real run where an agent gets something wrong. These are seeded from known domain pitfalls.

### "By symmetry" hides asymmetries
**What the agent assumes:** When a proof says "similarly" or "by symmetry", the parallel argument is valid.
**What's actually true:** "Similarly" frequently hides asymmetries. The parallel case may have a different sign, a different domain, or a subtly different structure. Always verify the parallel argument explicitly.
**Which agents this affects:** validator
**Example:** A proof showing $A \geq B$ "by symmetry" from $B \geq A$ — but the two cases use different inner products.

### Incompressibility isn't always stated
**What the agent assumes:** Transverse channel arguments work in general.
**What's actually true:** Arguments restricted to the transverse (shear) channel rely on incompressibility ($\nabla \cdot v = 0$) and a specific choice of wavevector direction. These must be explicitly in place before each transverse-channel claim. The author sometimes uses them without restating the assumption.
**Which agents this affects:** validator, orchestrator

### Projection state-dependence breaks composition
**What the agent assumes:** $\Pi_x \circ \Pi_x = \Pi_x$ (idempotency).
**What's actually true:** State-dependent projections satisfy $\Pi_x \circ \Pi_x = \Pi_x$ but $\Pi_x \circ \Pi_y \neq \Pi_x$ in general. Proofs that compose projections at different states need explicit justification.
**Which agents this affects:** validator, fixer

### Gradient expansion order shifts by one
**What the agent assumes:** Order $k^n$ in the stress tensor corresponds to order $k^n$ in the dispersion relation.
**What's actually true:** Substituting into the conservation equation $\partial_t \pi = -\partial_x T$ adds one derivative. Order $k^n$ in the stress becomes order $k^{n+1}$ in the dispersion. This is a common source of off-by-one errors.
**Which agents this affects:** validator, fixer

### Don't flag grammar or citations
**What the agent assumes:** It should report everything wrong it finds.
**What's actually true:** Mathematical verification has hard exclusions. Never produce findings about prose quality, grammar, voice, equation punctuation, missing citations, bib entries, or journal formatting. Those belong to copy-edit and citation-sweep. If in doubt, leave it out.
**Which agents this affects:** validator, optimizer

### "Held" findings must resolve at loop termination
**What the agent assumes:** Findings with issue confidence between 0.60 and 0.85 can remain "held" in the final report, presented as a middle state between dropped and escalated.
**What's actually true:** "Held" is a between-rounds state only. It means "carry forward to see if it recurs." When the loop terminates — whether clean, at bound, or because the fix report is empty — every held finding must be resolved: either drop it (confidence didn't increase, not recurring) or escalate it (recurred or confidence rose). A final report with "held" findings is incoherent — it presents issues with no resolution path and forces the human to do triage the skill should have completed.
**Which agents this affects:** orchestrator
**Evidence from this run:** Two findings (F003, F004) were left as "held" in the final completion report after the loop ended at round 2. Both were non-issues that should have been dropped.

### Don't flag notation preferences the target journal doesn't require
**What the agent assumes:** Scored constraints like C26 (\coloneqq for definitions) apply universally and should be reported whenever violated.
**What's actually true:** Scored constraints are weighted by journal convention. If the target journal (e.g., SIGMA) does not require or conventionally use a notation (e.g., \coloneqq), the finding's issue confidence should be below the drop threshold (< 0.60). Standard mathematical physics practice of using plain = for definitions is not a finding. The optimizer should not surface notation preferences that the target venue does not enforce.
**Which agents this affects:** optimizer, orchestrator
**Evidence from this run:** F003 flagged Definition 4.1 for using = instead of \coloneqq. SIGMA does not require \coloneqq. This was held instead of dropped.

### Don't flag implicit steps that are immediate for the target audience
**What the agent assumes:** If a proof doesn't explicitly state every intermediate step, it has a gap worth reporting.
**What's actually true:** A proof gap is only a finding if the missing step is non-obvious to the target audience. For SIGMA readers, standard symmetries like χ_l(π−α) = χ_l(α) extending a result from one angle to its complement are immediate. Reporting these as findings wastes the human's time on triage the validator should have resolved by scoring issue confidence below 0.60.
**Which agents this affects:** validator, orchestrator
**Evidence from this run:** F004 flagged Proposition 3.1's proof for not explicitly stating the π-complement symmetry. Any reader of a SIGMA paper can fill this in. Should have been dropped.
