# Plain Text Input Element Constraints

## Hard-reject constraints

### [Element:Plain Text Input]C01: Type value
The `type` field must be `"plain_text_input"`.

### [Element:Plain Text Input]C02: Placeholder type
The `placeholder` field, if present, must be a text object with type `plain_text` only.

### [Element:Plain Text Input]C03: Placeholder text length
The `text` field within `placeholder` must not exceed 150 characters.

### [Element:Plain Text Input]C04: min_length range
The `min_length` field, if present, must be an integer between 0 and 3000, inclusive.

### [Element:Plain Text Input]C05: max_length range
The `max_length` field, if present, must be an integer between 1 and 3000, inclusive.

### [Element:Plain Text Input]C06: multiline type
The `multiline` field, if present, must be a boolean.

### [Element:Plain Text Input]C07: focus_on_load type
The `focus_on_load` field, if present, must be a boolean.

### [Element:Plain Text Input]C08: dispatch_action_config type
The `dispatch_action_config` field, if present, must be a dispatch action configuration object.

## Scored constraints

### [Element:Plain Text Input]C10: Multiline used appropriately
The `multiline` field should be `true` for long-form content (descriptions, notes, comments) and `false` or omitted for short values (names, titles, codes). Mismatched multiline settings create awkward UX.
**Confidence signals:** Single-line input for a field that expects paragraphs, or multiline for a short value like a name or ID = high issue confidence. Multiline matches the expected content length = low issue confidence.

### [Element:Plain Text Input]C11: Placeholder is helpful
Placeholder text should show a format example or hint at expected content, not simply repeat the field label. A helpful placeholder reduces user confusion and input errors.
**Confidence signals:** Placeholder that duplicates the label exactly, or is empty/generic like "Type here" = high issue confidence. Placeholder that shows an example value or clarifies the expected format = low issue confidence.
