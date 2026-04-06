# Task Card Block Constraints

## Hard-reject constraints

### [Block:Task Card]C01: Type value
The `type` field must be `"task_card"`.

### [Block:Task Card]C02: task_id required
The `task_id` field is required and must be a string.

### [Block:Task Card]C03: title required
The `title` field is required and must be a string of plain text.

### [Block:Task Card]C04: details type
The `details` field, if present, must be a single `rich_text` block object.

### [Block:Task Card]C05: output type
The `output` field, if present, must be a single `rich_text` block object.

### [Block:Task Card]C06: sources item type
Each item in the `sources` array, if present, must be a URL source element.

### [Block:Task Card]C07: status allowed values
The `status` field, if present, must be one of: `"pending"`, `"in_progress"`, `"complete"`, or `"error"`.

## Scored constraints
