# Input Block Constraints

## Hard-reject constraints

### [Block:Input]C01: Type value
The `type` field must be `"input"`.

### [Block:Input]C02: Label required
The `label` field is required.

### [Block:Input]C03: Label type
The `label` field must be a text object with `type` of `plain_text`.

### [Block:Input]C04: Label max length
The `text` value within the `label` field must not exceed 2000 characters.

### [Block:Input]C05: Element required
The `element` field is required.

### [Block:Input]C06: Hint type
The `hint` field, if present, must be a text object with `type` of `plain_text`.

### [Block:Input]C07: Hint max length
The `text` value within the `hint` field must not exceed 2000 characters.

### [Block:Input]C08: dispatch_action incompatible with file_input
If `dispatch_action` is set to `true`, the `element` must not be a `file_input` block element. Combining them raises an unsupported type error.

## Scored constraints

### [Block:Input]C10: Label clarity
Labels should clearly describe what input is expected. Vague labels like "Value" or "Enter here" force users to guess what the field requires.
**Confidence signals:** Label is a single generic word with no hint = high. Label is slightly abbreviated but understandable in context = low.

### [Block:Input]C11: Placeholder helpfulness
Placeholder text should show the expected format or provide an example value, not repeat the label. A placeholder that duplicates the label wastes the opportunity to guide the user.
**Confidence signals:** Placeholder is identical to the label text = high. Placeholder is somewhat generic but adds minor guidance = low.
