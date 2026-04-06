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
