# Number Input Element Constraints

## Hard-reject constraints

### [Element:Number Input]C01: Type value
The `type` field must be `"number_input"`.

### [Element:Number Input]C02: is_decimal_allowed required
The `is_decimal_allowed` field is required and must be a boolean.

### [Element:Number Input]C03: Placeholder text type
The `placeholder` field, if present, must be a text object with type `plain_text` only.

### [Element:Number Input]C04: Placeholder text max length
The `text` value within the `placeholder` object must not exceed 150 characters.

### [Element:Number Input]C05: min_value not greater than max_value
When both `min_value` and `max_value` are present, `min_value` must not be greater than `max_value`.

### [Element:Number Input]C06: action_id max length
The `action_id` field, if present, must not exceed 255 characters.

## Scored constraints

### [Element:Number Input]C10: Placeholder shows expected range or format
Placeholder text should hint at the valid values or expected range (e.g., "1-100", "Enter quantity"), giving users guidance before they type.
**Confidence signals:** No placeholder or placeholder that just says "Enter number" with no range hint when min/max values exist = high issue confidence. Placeholder that indicates the expected range or format context = low issue confidence.
