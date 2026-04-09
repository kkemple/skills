# Context — Mathematical Verification

Loaded by: Optimizer, Orchestrator

## Audience

A mathematically literate reader of the work's field. Someone who knows the standard machinery the proof invokes and can fill in routine steps at sight, but cannot fill in anything the proof leaves genuinely open. Rigorous, expects complete arguments, and will not excuse a gap just because the result happens to be true.

"Routine for the target audience" is a load-bearing judgment, not a permission slip. If a step is standard machinery in the field the work sits in (e.g., Hodge decomposition on a compact oriented Riemannian manifold with no boundary), the reader fills it in without prompting. If a step requires the reader to guess which lemma is being invoked, or to reconstruct a computation the author elided, it is a gap.

## Quality signals

Mathematical content is verifiable-fit when it satisfies four structural signals. These are what the optimizer assesses; the validator assesses against constraints.

### Clarity

The reader can recover what is being claimed without ambiguity.
- Theorem statements are self-contained: the reader can understand what is claimed from the statement alone.
- Every symbol is defined at first appearance, including domain and codomain.
- Quantifier scope is explicit — "for all" and "there exists" are unambiguous in order and range.
- Definitions are distinguished from derivations (definitional vs. derived equalities are visually separable).

### Soundness

Each deductive step follows from what precedes it.
- No "therefore" or "hence" that hides a jump.
- Invoked standard results apply in the current setting — all hypotheses of the cited theorem are satisfied where it is used.
- Implication direction is correct; biconditionals prove both directions.
- Operator compositions in non-commutative settings are correctly ordered; state-dependent projections are not silently composed across states.

### Completeness of proofs

Every hypothesis is used, every case is handled, and no gap is left that the target reader cannot fill in at sight.
- Hypotheses that are never invoked are either redundant (the theorem is stronger than stated) or hide a gap.
- Boundary and degenerate cases are addressed or explicitly set aside with justification.
- "By symmetry" and "similarly" are used only where the parallel argument is genuinely parallel — not where a sign, domain, or structure differs.
- Division by zero, singular limits, and non-commuting operations are handled at the points where they could occur.

### Notation consistency

The same symbol means the same thing throughout the work.
- No symbol reuse with different meanings across sections.
- Operator fonts are stable (upright for named operators, italic for variables).
- Fourier, index, and sign conventions stated once and applied consistently.
- Free and dummy indices are balanced in every equation.

## Thresholds

Mathematical verification uses the default confidence thresholds:
- Auto-approve: issue >= 0.85 AND fix >= 0.85
- Escalate issue only: issue >= 0.85 AND fix < 0.85
- Drop: issue < 0.60

Weighting adjustments for this domain:
- **Mechanical checks** (index balance, dimensional analysis, operator formatting) weight issue confidence high (0.9+) because they're deterministic
- **Notation conventions** weight by how universal the convention is — $\Delta$ for Laplacian is universal (high), $\sigma_{ij}$ vs $S_{ij}$ for strain rate varies by subcommunity (medium)
- **Proof gap assessment** weights by how standard the audience is expected to find the skipped step — routine machinery for the work's field = low confidence it's a real gap; nonstandard = high
- **Framework-level assessments** (C20-C22: constructive instance, necessity, generality) weight medium — these are real concerns but involve more judgment than constraint checking

## Pipeline position

Math verification runs AFTER drafting and BEFORE copy-edit. Assume the mathematics has been drafted but not polished. Expect to find:
- `% AUTHOR:` comments from drafting (flag presence but these are not math errors)
- `% CITE:` comments (not in scope — citation sweeping handles these)
- Rough prose around proofs (not in scope — copy-edit handles this)

Do not produce findings about grammar, style, citation completeness, or surface formatting. Those belong to other skills in the pipeline.
