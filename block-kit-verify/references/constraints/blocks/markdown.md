# Markdown Block Constraints

## Hard-reject constraints

### [Block:Markdown]C01: Type value
The `type` field must be `"markdown"`.

### [Block:Markdown]C02: Text required
The `text` field is required.

### [Block:Markdown]C03: Text type
The `text` field must be a string.

### [Block:Markdown]C04: Cumulative text length
The cumulative character count of the `text` field across all `markdown` blocks in a single payload must not exceed 12,000 characters.

## Scored constraints
