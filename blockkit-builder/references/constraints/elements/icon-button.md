# Icon Button Element Constraints

## Hard-reject constraints

### [Element:Icon Button]C01: Type value
The `type` field must be `"icon_button"`.

### [Element:Icon Button]C02: Icon required
The `icon` field is required and must be a string. The only accepted value is `"trash"`.

### [Element:Icon Button]C03: Text required
The `text` field is required and must be a text object.

### [Element:Icon Button]C04: Text type
The `text` object must have `type` set to `"plain_text"`.

### [Element:Icon Button]C05: Value max length
The `value` field, if present, must not exceed 2000 characters.

### [Element:Icon Button]C06: Accessibility label max length
The `accessibility_label` field, if present, must not exceed 75 characters.

### [Element:Icon Button]C07: Parent block
The icon button element must be used inside a `context_actions` block.

## Scored constraints

### [Element:Icon Button]C10: Icon choice is clear
The icon should clearly convey the action to the user without requiring a text label. Users should be able to understand the button's purpose from the icon alone.
**Confidence signals:** Icon that does not relate to the action being performed, or could be confused with a different action = high issue confidence. Icon with a well-established meaning that matches the action (e.g., trash icon for delete) = low issue confidence.
