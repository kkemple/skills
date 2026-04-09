# Constraints — Mathematical Verification

Loaded by: Validator, Orchestrator, Fixer

## Hard-reject constraints

Binary. The constraint is violated or it isn't.

### C01: Proof establishes its claim
The proof must establish the exact statement of the theorem — not something stronger, weaker, or subtly different.

### C02: Each deductive step follows
Every "therefore" / "hence" / "so" / "it follows" must actually follow from what precedes it. A step that does not follow is a hard reject regardless of whether the conclusion happens to be true.

### C03: Invoked results apply in context
When a proof cites a standard result, all hypotheses of that result must be satisfied in the current setting. Applying a compact-manifold theorem to a non-compact case, or a finite-group result to a non-finite group, is a hard reject.

### C04: Implication direction correct
If A → B is claimed, the proof must establish A → B, not B → A. If "if and only if" is claimed, both directions must be proved.

### C05: No division by zero
Any formula where a denominator could be zero must either restrict the domain or handle the case.

### C06: Free indices balanced
In every equation, free indices must match on both sides. Dummy indices must appear exactly twice (once up, once down in Einstein convention).

## Scored constraints

### C10: All hypotheses used in proof
Every stated hypothesis should be used somewhere in its proof. Unused hypothesis suggests the theorem is stronger than claimed (medium severity) or the proof has a gap (high severity).
**Confidence signals:** Hypothesis invoked implicitly via a cited result = lower issue confidence. Hypothesis genuinely never touched = high.

### C11: No implicit hypotheses
Proofs should not rely on assumptions not stated in the theorem (smoothness, compactness, incompressibility).
**Confidence signals:** Standard field assumptions (smoothness in differential geometry) = lower. Nontrivial assumptions (incompressibility in general fluid dynamics) = higher.

### C12: Notation consistency
Same symbol must mean the same thing throughout. No symbol reuse with different meanings. Operator fonts consistent.
**Confidence signals:** Conflicting uses in same section = high. Same symbol with context-dependent meaning across distant sections = medium.

### C13: Definition completeness
Every object in a theorem statement defined before or within it. Every symbol defined at first appearance. Domains and codomains specified.
**Confidence signals:** Undefined symbol in theorem statement = high. Undefined in running prose where meaning is clear = low.

### C14: Equation chain integrity
Each step in a displayed equation chain must be reproducible. Substitutions valid. Signs, factors, contractions correct.
**Confidence signals:** Algebraic error reproducible by re-derivation = high. Skipped intermediate step that appears correct = low.

### C15: Quantifier hygiene
"For all" and "there exists" properly scoped and in correct order. Universal claims genuinely universal. Existence claims backed by argument. "Unique" proved with both existence and uniqueness.
**Confidence signals:** Wrong quantifier order = high. Implicit quantifier in informal statement = low.

### C16: Boundary and degenerate cases
Results degenerate sensibly at parameter boundaries. Limits commute when taken in different orders (or non-commutativity addressed).
**Confidence signals:** Formula gives infinity/nonsense at natural limit = high. Unchecked but plausible boundary behavior = medium.

### C17: Operator ordering
In non-commutative settings, operator compositions must be correctly ordered. $AB \neq BA$ for projections on tensors.
**Confidence signals:** Explicit order reversal = high. Ambiguous notation where order matters = medium.

### C18: Projection state-dependence
If $\Pi_x$ is claimed idempotent, state-dependence must not break the property. $\Pi_x \circ \Pi_y \neq \Pi_x$ in general.
**Confidence signals:** Explicit misuse across states = high.

### C19: Fourier convention consistency
Factors of $i$, $2\pi$, and signs must be consistent with the paper's stated convention throughout.
**Confidence signals:** Convention mismatch between equations = high. Unstated but consistent convention = low.

### C20: Constructive instance
If a framework is introduced and claimed explanatory, the paper must construct at least one instance from first principles. Post-hoc identification is description, not explanation.
**Confidence signals:** No constructive instance anywhere = high. One constructive plus additional post-hoc = clean.

### C21: Framework necessity
The framework must produce at least one result that cannot be obtained without it.
**Confidence signals:** Only known results re-derived = high. Novel prediction or bound = clean.

### C22: Generality matches scope
If generality is claimed, the stated conditions must hold in multiple independent settings.
**Confidence signals:** Only one known system satisfies conditions = high. Multiple systems demonstrated = clean.

### C23: Dimensional consistency
Both sides of every equation must have the same physical dimensions. Transport coefficients, frequencies, wavevectors must be dimensionally consistent.
**Confidence signals:** Dimensional mismatch = high. Dimensionless equation with absorbed units = low.

### C24: Standard notation for domain
Symbols should match the standard notation conventions of the work's field ($\eta$ for shear viscosity, $\Delta$ for Laplacian, $\lambda_n$ for eigenvalues). Nonstandard choices flagged.
**Confidence signals:** Conflict with universal convention = high. Acceptable subcommunity variant = low.

### C25: Operator formatting
All operators use `\DeclareMathOperator` or `\mathrm{}` (upright). Check: tr, div, curl, grad, Re, Im, sgn.
**Confidence signals:** Italic operator name = high (mechanical).

### C26: Definitional equality notation
`\coloneqq` for definitions, plain `=` for derived equalities. Consistent throughout.
**Confidence signals:** Mixed usage = medium.

## Standard results frequently invoked

| Result | Key hypotheses | Watch for |
|--------|---------------|-----------|
| Hodge decomposition | Compact, oriented, no boundary, Riemannian | Applied to non-compact or boundary cases? |
| Rayleigh-Ritz variational characterization | Self-adjoint, bounded below, Hilbert space | Applied to non-self-adjoint operators? |
| Peter-Weyl theorem | Compact group | Applied to non-compact groups? |
| Burnett gradient expansion | Convergent series; near equilibrium | Applied far from equilibrium? |
| Mori-Zwanzig continued fraction | Well-defined Liouvillian; separable slow/fast | Separation justified? |
| Gauss-Bonnet | Compact, oriented, even-dimensional (or with boundary) | Dimension check |
| Character orthogonality | Finite or compact group; correct measure | Normalization convention |
