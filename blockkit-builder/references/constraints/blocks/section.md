# Section Block Constraints

## Hard-reject constraints

### [Block:Section]C01: Type value
The `type` field must be `"section"`.

### [Block:Section]C02: Text or fields required
A section block must contain at least one of `text` or `fields`. It may contain both.

### [Block:Section]C03: Text length
The `text` field must be between 1 and 3000 characters.

### [Block:Section]C04: Text type
The `text` field must be a text object with type `mrkdwn` or `plain_text`.

### [Block:Section]C05: Fields max items
The `fields` array must not contain more than 10 text objects.

### [Block:Section]C06: Fields item max length
Each text object in `fields` must not exceed 2000 characters.

### [Block:Section]C07: Fields item type
Each item in `fields` must be a text object with type `mrkdwn` or `plain_text`.

### [Block:Section]C08: Accessory element types
The `accessory` field, if present, must be one of: button, overflow menu, select menu, multi-select menu, date picker, time picker, checkboxes, radio buttons, or image element.

## Scored constraints

### [Block:Section]C10: Accessory complements text
When both `text` and `accessory` are present, the accessory should be contextually related to the text content.
**Confidence signals:** Completely unrelated accessory = high. Loosely related = low.
