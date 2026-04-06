# Rich Text Input Element Constraints

## Hard-reject constraints

### [Element:Rich Text Input]C01: Type value
The `type` field must be `"rich_text_input"`.

### [Element:Rich Text Input]C02: Initial value type
The `initial_value` field, if present, must be a rich text block object.

### [Element:Rich Text Input]C03: Placeholder type
The `placeholder` field, if present, must be a text object with type `plain_text`.

### [Element:Rich Text Input]C04: Placeholder text max length
The `text` field within `placeholder` must not exceed 150 characters.

### [Element:Rich Text Input]C05: Focus on load type
The `focus_on_load` field, if present, must be a boolean. Defaults to `false`.

### [Element:Rich Text Input]C06: Dispatch action config type
The `dispatch_action_config` field, if present, must be a dispatch action configuration object.

## Scored constraints

### [Element:Rich Text Input]C10: Placeholder guides the user
Placeholder text should indicate what kind of formatted content is expected (e.g., "Write a project update with key highlights...", "Describe the issue in detail"), helping users understand the scope and style of input.
**Confidence signals:** No placeholder or a generic placeholder like "Type here" in a rich text field = high issue confidence. Placeholder that describes the expected content type and level of detail = low issue confidence.
