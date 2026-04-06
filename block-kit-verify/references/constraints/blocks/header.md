# Header Block Constraints

## Hard-reject constraints

### [Block:Header]C01: Type value
The `type` field must be `"header"`.

### [Block:Header]C02: Text required
The `text` field is required.

### [Block:Header]C03: Text type
The `text` field must be a `plain_text` text object. `mrkdwn` is not allowed.

### [Block:Header]C04: Text max length
The `text` in the `text` field must not exceed 150 characters.

## Scored constraints
