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

### [Block:Image]C10: Alt text is descriptive
The `alt_text` should describe the image content specifically. Generic values like "image", "photo", or "screenshot" provide no accessibility value and no context when the image fails to load.
**Confidence signals:** Alt text is a single generic word = high. Alt text is brief but somewhat specific = low.

### [Block:Image]C11: Contextual relevance
The image should relate to the surrounding blocks. A decorative or unrelated image disrupts the message flow and adds no informational value.
**Confidence signals:** Image has no connection to adjacent text or actions = high. Image is tangentially related = low.
