# Email Input Element Constraints

## Hard-reject constraints

### [Element:Email Input]C01: Type value
The `type` field must be `"email_text_input"`.

### [Element:Email Input]C02: Placeholder type
The `placeholder` field, if present, must be a `plain_text` only text object.

### [Element:Email Input]C03: Placeholder text length
The `text` field within `placeholder` must not exceed 150 characters.

### [Element:Email Input]C04: Focus on load type
The `focus_on_load` field, if present, must be a boolean. Defaults to `false`.

### [Element:Email Input]C05: Dispatch action config type
The `dispatch_action_config` field, if present, must be a dispatch configuration object.

### [Element:Email Input]C06: Initial value type
The `initial_value` field, if present, must be a string.

## Scored constraints

### [Element:Email Input]C10: Placeholder shows format example
Placeholder text should show an example email format (e.g., "name@company.com") to guide the user on the expected input, rather than generic text like "Enter email".
**Confidence signals:** Placeholder with no example or just "Enter email" = high issue confidence. Placeholder showing a realistic example email address = low issue confidence.
