# Radio Buttons Element Constraints

## Hard-reject constraints

### [Element:Radio Buttons]C01: Type value
The `type` field must be `"radio_buttons"`.

### [Element:Radio Buttons]C02: Options required
The `options` field is required and must be an array of option objects.

### [Element:Radio Buttons]C03: Options max items
The `options` array must not contain more than 10 options.

### [Element:Radio Buttons]C04: Initial option must match
The `initial_option` field, if present, must be an option object that exactly matches one of the options within `options`.

### [Element:Radio Buttons]C05: Action ID max length
The `action_id` field, if present, must not exceed 255 characters.

### [Element:Radio Buttons]C06: Focus on load type
The `focus_on_load` field, if present, must be a boolean.

## Scored constraints

### [Element:Radio Buttons]C10: Options are mutually exclusive
Radio button options should represent genuinely exclusive choices. If a user could reasonably want to select more than one option, checkboxes are a better fit.
**Confidence signals:** Options that overlap or could logically be combined (e.g., "Email" and "Email and SMS" as separate options) = high issue confidence. Each option is clearly distinct and selecting one rules out the others = low issue confidence.

### [Element:Radio Buttons]C11: Initial option matches common case
When `initial_option` is set, it should be pre-selected to the most likely or safest default choice. Pre-selecting an uncommon or risky option may lead to accidental submissions.
**Confidence signals:** Pre-selected option is a rare or potentially harmful choice = high issue confidence. Pre-selected option is the most common or safest default = low issue confidence.
