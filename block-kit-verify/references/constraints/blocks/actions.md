# Actions Block Constraints

## Hard-reject constraints

### [Block:Actions]C01: Type value
The `type` field must be `"actions"`.

### [Block:Actions]C02: Elements required
The `elements` field is required and must be an array of interactive element objects.

### [Block:Actions]C03: Elements max items
The `elements` array must not contain more than 25 elements.

### [Block:Actions]C04: Elements allowed types
Each item in `elements` must be one of: button, select menu, overflow menu, or date picker.

## Scored constraints
