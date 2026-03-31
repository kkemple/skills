# Domain — Mathematical Verification of Journal Papers

Loaded by: Optimizer, Orchestrator

## Field

Mathematical physics and pure mathematics, spanning spectral geometry, representation theory, differential geometry, algebraic combinatorics, fluid dynamics, and information theory. Papers extract self-contained technical results from a broader research program, stripped of the parent framework.

## Quality signals for a mathematically verified paper

A good paper in this domain:

- Has a single clear logical chain from problem statement to closure (theorem proved, bound computed, mechanism identified)
- Every section answers exactly one question the reader needs to follow the next section
- Proofs are terse but complete — every step justified, no step belabored
- Complex proofs decompose into lemmas, each proving one clean fact, with short connecting prose explaining the flow
- Theorem statements are precise and self-contained — a reader can understand what's claimed from the statement alone
- Notation is standard for the target field and internally consistent
- Setup sections define exactly what's needed and nothing more
- Connections to adjacent work are specific and substantive, not vague gestures
- Open questions are concrete and about the specific result, not the broader program

## Common patterns in this author's papers

### Proof architecture
- Lemma → proof → connecting prose → lemma → proof → theorem → proof
- The coexact spectral gap paper: two short lemmas and a three-line main theorem proof
- The KK spectrum paper: ~20-line algebraic argument for Theorem 1, building on explicit character sums

### Standard machinery used
- Hodge decomposition and spectral theory on compact Riemannian manifolds
- Character orthogonality and Peter-Weyl decomposition for finite/compact groups
- Rayleigh-Ritz variational characterization of eigenvalues
- Molien series and invariant theory for quotient spaces
- Mori-Zwanzig continued fraction expansion and Lanczos coefficients
- Burnett/Chapman-Enskog gradient expansion hierarchy
- Gauss-Bonnet theorem on compact oriented manifolds

### Specific checks for this author's domain
- **Dispersion relations:** $\omega$ has units of inverse time, $k$ has inverse length. $D \sim \text{length}^2/\text{time}$, $D_4 \sim \text{length}^4/\text{time}$.
- **Gradient expansion order counting:** "Order $k^n$ in the stress" becomes "order $k^{n+1}$ in the dispersion" after substituting into the conservation equation (adds one derivative).
- **Eigenvalue formulas:** For specific manifolds (spheres, quotient spaces), cross-check against standard references.
- **Transverse channel restriction:** Arguments in the transverse (shear) channel rely on incompressibility ($\nabla \cdot v = 0$) and a specific wavevector direction. Verify these are in place.

## What this domain does NOT include

Mathematical verification does not assess:
- Prose quality, grammar, voice, tone (that's copy-edit)
- Citation completeness, bibliography correctness (that's citation-sweep)
- Whether the paper should exist or whether results are interesting
- Journal formatting compliance
