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
