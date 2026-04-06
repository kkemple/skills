# Time Picker Element Constraints

## Hard-reject constraints

### [Element:Time Picker]C01: Type value
The `type` field must be `"timepicker"`.

### [Element:Time Picker]C02: Initial time format
The `initial_time` field, if present, must be a string in the format `HH:mm`, where `HH` is the 24-hour format of an hour (00 to 23) and `mm` is minutes with leading zeros (00 to 59).

### [Element:Time Picker]C03: Confirm type
The `confirm` field, if present, must be a confirm dialog composition object.

### [Element:Time Picker]C04: Focus on load type
The `focus_on_load` field, if present, must be a boolean. Defaults to `false`.

### [Element:Time Picker]C05: Placeholder type
The `placeholder` field, if present, must be a text object with type `plain_text`.

### [Element:Time Picker]C06: Placeholder text max length
The `text` value within the `placeholder` object must not exceed 150 characters.

### [Element:Time Picker]C07: Timezone format
The `timezone` field, if present, must be a string in IANA timezone format (e.g., `"America/Chicago"`).

## Scored constraints
