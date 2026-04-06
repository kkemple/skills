# Multi-Select Menu Element Constraints

## Hard-reject constraints

### [Element:Multi-Select Menu]C01: Type value
The `type` field must be one of `"multi_static_select"`, `"multi_external_select"`, `"multi_users_select"`, `"multi_conversations_select"`, or `"multi_channels_select"`.

### [Element:Multi-Select Menu]C02: Static options or option groups required
When `type` is `"multi_static_select"`, at least one of `options` or `option_groups` must be provided.

### [Element:Multi-Select Menu]C03: Options and option groups mutually exclusive (static)
When `type` is `"multi_static_select"`, `options` and `option_groups` must not both be specified.

### [Element:Multi-Select Menu]C04: Options max items (static)
When `type` is `"multi_static_select"`, the `options` array must not contain more than 100 option objects.

### [Element:Multi-Select Menu]C05: Option text max length (static)
When `type` is `"multi_static_select"`, each option must be less than 76 characters.

### [Element:Multi-Select Menu]C06: Option groups max items (static)
When `type` is `"multi_static_select"`, the `option_groups` array must not contain more than 100 option group objects.

### [Element:Multi-Select Menu]C07: Placeholder type
The `placeholder` field, if present, must be a text object with `type: plain_text`. No other text object type is allowed.

### [Element:Multi-Select Menu]C08: Placeholder max length
The `placeholder` field text, if present, must not exceed 150 characters.

### [Element:Multi-Select Menu]C09: Max selected items minimum
The `max_selected_items` field, if present, must be at least 1.

### [Element:Multi-Select Menu]C10: Confirm type
The `confirm` field, if present, must be a confirmation dialog object.

### [Element:Multi-Select Menu]C11: Initial options type (static)
When `type` is `"multi_static_select"`, the `initial_options` field, if present, must be an array of option objects that exactly match one or more of the options within `options` or `option_groups`.

### [Element:Multi-Select Menu]C12: Initial options type (external)
When `type` is `"multi_external_select"`, the `initial_options` field, if present, must be an array of option objects that exactly match one or more of the options within the externally loaded `options` or `option_groups`.

### [Element:Multi-Select Menu]C13: Filter type (conversations)
When `type` is `"multi_conversations_select"`, the `filter` field, if present, must be a conversation filter object.

## Scored constraints

### [Element:Multi-Select Menu]C20: Option count is manageable
Very long flat option lists degrade usability. When the number of options is large, consider using `option_groups` to organize them into logical categories for easier scanning.
**Confidence signals:** Flat `options` array with 20+ ungrouped items when logical categories exist = high issue confidence. Options organized into `option_groups` or a short flat list where grouping is unnecessary = low issue confidence.

### [Element:Multi-Select Menu]C21: Max selected items is appropriate
The `max_selected_items` value, when set, should reflect the actual constraint of the workflow. Setting it too low unnecessarily limits users; omitting it when there is a real upper bound leads to invalid submissions downstream.
**Confidence signals:** `max_selected_items` set to 1 (should be a single select instead), or no limit when the workflow cannot handle unlimited selections = high issue confidence. Limit matches the actual downstream capacity or is omitted when truly unbounded = low issue confidence.
