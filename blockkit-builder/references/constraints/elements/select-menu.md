# Select Menu Element Constraints

## Hard-reject constraints

### [Element:Select Menu]C01: Type value
The `type` field must be one of `"static_select"`, `"external_select"`, `"users_select"`, `"conversations_select"`, or `"channels_select"`.

### [Element:Select Menu]C02: Static select requires options or option_groups
When `type` is `"static_select"`, the element must contain either an `options` field or an `option_groups` field.

### [Element:Select Menu]C03: Static select options and option_groups are mutually exclusive
When `type` is `"static_select"`, if `options` is specified then `option_groups` must not be present, and vice versa.

### [Element:Select Menu]C04: Static select options max items
When `type` is `"static_select"`, the `options` array must not contain more than 100 option objects.

### [Element:Select Menu]C05: Static select option_groups max items
When `type` is `"static_select"`, the `option_groups` array must not contain more than 100 option group objects.

### [Element:Select Menu]C06: Placeholder type
The `placeholder` field, if present, must be a text object with type `"plain_text"` only.

### [Element:Select Menu]C07: Placeholder max length
The `placeholder` text object's `text` field, if present, must not exceed 150 characters.

### [Element:Select Menu]C08: Focus on load type
The `focus_on_load` field, if present, must be a Boolean.

### [Element:Select Menu]C09: Initial option must match (static_select)
When `type` is `"static_select"`, the `initial_option` field, if present, must exactly match one of the options within `options` or `option_groups`.

### [Element:Select Menu]C10: Initial option must match (external_select)
When `type` is `"external_select"`, the `initial_option` field, if present, must exactly match one of the options within the `options` or `option_groups` loaded from the external data source.

### [Element:Select Menu]C11: Min query length type
When `type` is `"external_select"`, the `min_query_length` field, if present, must be an Integer.

### [Element:Select Menu]C12: Conversations select default_to_current_conversation type
When `type` is `"conversations_select"`, the `default_to_current_conversation` field, if present, must be a Boolean.

### [Element:Select Menu]C13: Allowed parent blocks
The select menu element must be used inside of a section block, actions block, or input block.

## Scored constraints

### [Element:Select Menu]C20: Placeholder is descriptive
Placeholder text should describe what the user is selecting ("Choose a channel", "Pick a priority level"), not use generic phrasing like "Select..." or "Choose one".
**Confidence signals:** Placeholder is just "Select..." or "Choose an option" with no indication of what is being selected = high issue confidence. Placeholder names the category or type of item being chosen = low issue confidence.

### [Element:Select Menu]C21: Option count is appropriate
Very few options (2-3) may work better as radio buttons, which display all choices at once without requiring a click to open. Conversely, very long flat option lists should consider `option_groups` for organization.
**Confidence signals:** Select menu with only 2 options when radio buttons would show both at a glance, or 50+ flat options with no grouping = high issue confidence. Option count suits a dropdown interaction, with grouping used for large lists = low issue confidence.
