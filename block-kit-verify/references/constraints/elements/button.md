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
