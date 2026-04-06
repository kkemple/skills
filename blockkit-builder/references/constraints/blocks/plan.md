# Plan Block Constraints

## Hard-reject constraints

### [Block:Plan]C01: Type value
The `type` field must be `"plan"`.

### [Block:Plan]C02: Title required
The `title` field is required and must be present.

### [Block:Plan]C03: Title type
The `title` field must be a plain text object.

### [Block:Plan]C04: Tasks item type
Each item in the `tasks` array, if present, must be a task card block.

## Scored constraints

### [Block:Plan]C10: Task granularity
Tasks within a plan should be specific enough to be individually actionable. Overly broad tasks like "Set up project" obscure what the user actually needs to do.
**Confidence signals:** Task description is a vague multi-step concept = high. Task is clear but could be split further = low.

### [Block:Plan]C11: Task completeness
The plan should cover all steps needed to achieve the stated goal, not just a partial list. Missing steps force users to infer the rest on their own.
**Confidence signals:** Obvious steps are missing from the sequence = high. Plan covers the main path but omits edge-case handling = low.
