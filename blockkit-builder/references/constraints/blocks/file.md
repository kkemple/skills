# File Block Constraints

## Hard-reject constraints

### [Block:File]C01: Type value
The `type` field must be `"file"`.

### [Block:File]C02: External ID required
The `external_id` field is required and must be a string.

### [Block:File]C03: Source required
The `source` field is required and must be `"remote"`.

## Scored constraints

### [Block:File]C10: Surrounding context
File blocks should have nearby section or context blocks explaining what the file is or why it is shared. A standalone file block with no surrounding explanation forces the recipient to open the file to understand its purpose.
**Confidence signals:** File block with no adjacent explanatory blocks = high. File block following a message that implicitly references it = low.
