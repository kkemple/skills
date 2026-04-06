# Context Block Constraints

## Hard-reject constraints

### [Block:Context]C01: Type value
The `type` field must be `"context"`.

### [Block:Context]C02: Elements required
The `elements` field is required and must be present.

### [Block:Context]C03: Elements max items
The `elements` array must not contain more than 10 items.

### [Block:Context]C04: Elements allowed types
Each item in `elements` must be an image element or a text object (`mrkdwn` or `plain_text`).

## Scored constraints
