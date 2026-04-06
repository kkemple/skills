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

### [Block:Header]C10: Text length appropriate
Headers work best when kept short (under 50 characters) even though 150 characters are allowed. Long headers lose visual impact and compete with body text.
**Confidence signals:** Header over 80 characters = high. Header between 50-80 characters = low.

### [Block:Header]C11: Hierarchy usage
Headers should separate logical sections of a message. Using a header before every block or using multiple headers without intervening content creates noise rather than structure.
**Confidence signals:** Consecutive headers with no content between them = high. Header before a small section that could be merged = low.
