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

### [Element:Image]C10: Alt text is specific
The `alt_text` field should describe the actual content of the image, not use generic descriptions like "image", "icon", "photo", or "picture". Specific alt text improves accessibility and gives users meaningful context when images cannot be displayed.
**Confidence signals:** Alt text that is a single generic word like "image" or "icon", or is identical across multiple images = high issue confidence. Alt text that describes the specific content or purpose of the image = low issue confidence.
