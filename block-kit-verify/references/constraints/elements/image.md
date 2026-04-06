# Image Element Constraints

## Hard-reject constraints

### [Element:Image]C01: Type value
The `type` field must be `"image"`.

### [Element:Image]C02: alt_text required
The `alt_text` field is required and must be a plain-text string. It should not contain any markup.

### [Element:Image]C03: image_url or slack_file required
You must provide either an `image_url` or a `slack_file`. At least one is required.

### [Element:Image]C04: image_url max length
The `image_url` field, if present, must not exceed 3000 characters.

### [Element:Image]C05: slack_file type
The `slack_file` field, if present, must be a Slack image file object.

## Scored constraints
