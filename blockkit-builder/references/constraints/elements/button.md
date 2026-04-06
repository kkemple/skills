# Button Element Constraints

## Hard-reject constraints

### [Element:Button]C01: Type value
The `type` field must be `"button"`.

### [Element:Button]C02: Text required
The `text` field is required and must be a text object.

### [Element:Button]C03: Text type
The `text` field must be of `type: plain_text`. No other text object type is allowed.

### [Element:Button]C04: Text max length
The `text` field text must not exceed 75 characters.

### [Element:Button]C05: URL max length
The `url` field, if present, must not exceed 3000 characters.

### [Element:Button]C06: Value max length
The `value` field, if present, must not exceed 2000 characters.

### [Element:Button]C07: Style allowed values
The `style` field, if present, must be one of `"primary"` or `"danger"`.

### [Element:Button]C08: Confirm type
The `confirm` field, if present, must be a confirmation dialog object.

### [Element:Button]C09: Accessibility label max length
The `accessibility_label` field, if present, must not exceed 75 characters.

## Scored constraints

### [Element:Button]C10: Label is action-oriented
Button text should describe the action the user is taking ("Approve", "View details", "Save changes"), not use generic labels ("Click here", "Submit", "OK").
**Confidence signals:** Generic or vague label text like "Click here", "Go", "Submit" = high issue confidence. Specific verb-noun phrasing that describes the outcome = low issue confidence.

### [Element:Button]C11: Style used appropriately
The `primary` style should be reserved for the main intended action in a group of buttons. The `danger` style should only be used for destructive or irreversible actions (delete, remove, revoke). Buttons that are not the primary action and are not destructive should omit the style field.
**Confidence signals:** `danger` style on a non-destructive action, or `primary` on every button in a group = high issue confidence. `danger` on delete/remove actions, `primary` on a single prominent action = low issue confidence.
