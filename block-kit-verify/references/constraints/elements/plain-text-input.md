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
