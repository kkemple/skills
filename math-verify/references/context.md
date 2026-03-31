# Context — Mathematical Verification

Loaded by: Optimizer, Orchestrator

## Audience

Referees and readers of mathematical physics and pure mathematics journals. They are comfortable with rigorous proofs and expect complete arguments. What counts as "common knowledge" depends on the target journal:

- **CMP/AHP readers:** Know Hodge theory, spectral theory, basic representation theory, Riemannian geometry. Don't need these defined. May need specific semigroup theory or invariant-ring machinery defined.
- **JGA readers:** Know geometric analysis deeply — manifolds, PDEs, spectral gaps, Hodge decomposition. May need physics motivation explained.
- **LMP readers:** Slightly more physics-leaning than CMP. Know QFT basics and mathematical physics conventions. Compressed proofs are fine for routine steps.
- **JAC readers:** Know algebraic combinatorics — groups, semigroups, generating functions, Coxeter systems. Do NOT assume differential geometry background.

## Venue / target

The target journal is specified per paper in the scaffolded `main.tex` (document class and metadata). Use the journal profiles from `paper-draft/references/journal-profiles.md` to calibrate:
- How detailed proofs should be (CMP wants every step; LMP allows sketched routine steps)
- What background can be assumed
- What notation is standard for that audience

## Thresholds

Mathematical verification uses the default confidence thresholds:
- Auto-approve: issue >= 0.85 AND fix >= 0.85
- Escalate issue only: issue >= 0.85 AND fix < 0.85
- Drop: issue < 0.60

Weighting adjustments for this domain:
- **Mechanical checks** (index balance, dimensional analysis, operator formatting) weight issue confidence high (0.9+) because they're deterministic
- **Notation conventions** weight by how universal the convention is — $\Delta$ for Laplacian is universal (high), $\sigma_{ij}$ vs $S_{ij}$ for strain rate varies by subcommunity (medium)
- **Proof gap assessment** weights by how standard the audience is expected to find the skipped step — routine for the target journal = low confidence it's a real gap; nonstandard = high
- **Framework-level assessments** (C20-C22: constructive instance, necessity, generality) weight medium — these are real concerns but involve more judgment than constraint checking

## Pipeline position

Math verification runs AFTER paper-draft and BEFORE copy-edit. Assume the mathematics has been drafted but not polished. Expect to find:
- `% AUTHOR:` comments from drafting (flag presence but these are not math errors)
- `% CITE:` comments (not in scope — citation-sweep handles these)
- Rough prose around proofs (not in scope — copy-edit handles this)

Do not produce findings about grammar, style, citation completeness, or journal formatting. Those belong to other skills in the pipeline.
