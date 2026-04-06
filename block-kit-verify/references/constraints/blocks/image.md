# Image Block Constraints

## Hard-reject constraints

### [Block:Image]C01: Type value
The `type` field must be `"image"`.

### [Block:Image]C02: Alt text required
The `alt_text` field is required.

### [Block:Image]C03: Alt text max length
The `alt_text` field must not exceed 2000 characters.

### [Block:Image]C04: Image source required
The block must contain at least one of `image_url` or `slack_file`.

### [Block:Image]C05: Image URL max length
The `image_url` field, if present, must not exceed 3000 characters.

### [Block:Image]C06: Title type
The `title` field, if present, must be a text object with type `plain_text` only.

### [Block:Image]C07: Title text max length
The `title` text object's `text` field, if present, must not exceed 2000 characters.

## Scored constraints
