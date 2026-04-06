# Context Actions Block Constraints

## Hard-reject constraints

### [Block:Context Actions]C01: Type value
The `type` field must be `"context_actions"`.

### [Block:Context Actions]C02: Elements required
The `elements` field is required and must be an array.

### [Block:Context Actions]C03: Elements allowed types
Each item in the `elements` array must be a feedback buttons element or an icon button element.

### [Block:Context Actions]C04: Elements max items
The `elements` array must not contain more than 5 items.

## Scored constraints
