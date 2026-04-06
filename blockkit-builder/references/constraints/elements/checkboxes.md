# Checkboxes Element Constraints

## Hard-reject constraints

### [Element:Checkboxes]C01: Type value
The `type` field must be `"checkboxes"`.

### [Element:Checkboxes]C02: Options required
The `options` field is required and must be an array of option objects.

### [Element:Checkboxes]C03: Options max items
The `options` array must not contain more than 10 option objects.

### [Element:Checkboxes]C04: Initial options must match options
The `initial_options` field, if present, must be an array of option objects that exactly match one or more of the options within `options`.

### [Element:Checkboxes]C05: Confirm object type
The `confirm` field, if present, must be a confirmation dialog object.

### [Element:Checkboxes]C06: Focus on load
The `focus_on_load` field, if present, must be a boolean. Only one element per view can have `focus_on_load` set to `true`. Defaults to `false`.

### [Element:Checkboxes]C07: Allowed parent blocks
The checkboxes element may only be used within a section block, actions block, or input block.

## Scored constraints

### [Element:Checkboxes]C10: Option text is clear and distinct
Each checkbox option should be clearly distinguishable from the others. Options should not overlap in meaning or use ambiguous phrasing that makes it hard to tell them apart.
**Confidence signals:** Options with near-identical wording or overlapping scope = high issue confidence. Each option describes a clearly separate choice = low issue confidence.

### [Element:Checkboxes]C11: Initial options are sensible
Pre-selected options via `initial_options` should represent the most common, recommended, or safe default choice. Users should not be surprised by what is already checked.
**Confidence signals:** Uncommon or risky options pre-selected, or all options pre-selected = high issue confidence. The most typical or recommended options pre-selected = low issue confidence.
