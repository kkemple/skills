# Date Picker Element Constraints

## Hard-reject constraints

### [Element:Date Picker]C01: Type value
The `type` field must be `"datepicker"`.

### [Element:Date Picker]C02: Initial date format
The `initial_date` field, if present, must be a string in the format `YYYY-MM-DD`.

### [Element:Date Picker]C03: Confirm object type
The `confirm` field, if present, must be a confirmation dialog object.

### [Element:Date Picker]C04: Focus on load type
The `focus_on_load` field, if present, must be a boolean. Defaults to `false`.

### [Element:Date Picker]C05: Placeholder type
The `placeholder` field, if present, must be a text object with type `plain_text` only.

### [Element:Date Picker]C06: Placeholder text max length
The `text` value within the `placeholder` object must not exceed 150 characters.

## Scored constraints
