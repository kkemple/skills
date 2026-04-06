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
