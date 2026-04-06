# Datetime Picker Element Constraints

## Hard-reject constraints

### [Element:Datetime Picker]C01: Type value
The `type` field must be `"datetimepicker"`.

### [Element:Datetime Picker]C02: Initial date time type
The `initial_date_time` field, if present, must be an integer representing a UNIX timestamp in seconds (10 digits, e.g. `1628633820`).

### [Element:Datetime Picker]C03: Confirm object type
The `confirm` field, if present, must be a confirmation dialog object.

### [Element:Datetime Picker]C04: Focus on load type
The `focus_on_load` field, if present, must be a boolean. Defaults to `false`.

## Scored constraints

### [Element:Datetime Picker]C10: Placeholder indicates expected context
Placeholder text should hint at what the datetime represents (e.g., "Reminder time", "Event start"), not use generic phrasing like "Select date and time".
**Confidence signals:** Generic or absent placeholder that gives no context about the datetime's purpose = high issue confidence. Descriptive placeholder that tells the user what they are scheduling or selecting = low issue confidence.
