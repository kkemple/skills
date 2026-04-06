# File Input Element Constraints

## Hard-reject constraints

### [Element:File Input]C01: Type value
The `type` field must be `"file_input"`.

### [Element:File Input]C02: Filetypes type
The `filetypes` field, if present, must be an array of strings representing valid file extensions.

### [Element:File Input]C03: Max files minimum
The `max_files` field, if present, must be at least 1.

### [Element:File Input]C04: Max files maximum
The `max_files` field, if present, must not exceed 10.

### [Element:File Input]C05: Parent block type
The `file_input` element must be used inside an `input` block.

## Scored constraints
