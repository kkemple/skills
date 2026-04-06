# Video Block Constraints

## Hard-reject constraints

### [Block:Video]C01: Type value
The `type` field must be `"video"`.

### [Block:Video]C02: alt_text required
The `alt_text` field is required and must be a string.

### [Block:Video]C03: title required
The `title` field is required and must be a text object with `type` of `plain_text`.

### [Block:Video]C04: title text max length
The `text` within the `title` object must be less than 200 characters.

### [Block:Video]C05: thumbnail_url required
The `thumbnail_url` field is required and must be a string.

### [Block:Video]C06: video_url required
The `video_url` field is required and must be a string. It must point to an HTTPS URL.

### [Block:Video]C07: description type
The `description` field, if present, must be a text object with `type` of `plain_text`.

### [Block:Video]C08: description text max length
The `text` within the `description` object, if present, must be less than 200 characters.

### [Block:Video]C09: author_name max length
The `author_name` field, if present, must be less than 50 characters.

### [Block:Video]C10: title_url must be HTTPS
The `title_url` field, if present, must be an HTTPS URL.

## Scored constraints

### [Block:Video]C20: Title is descriptive
The `title` should describe the video content specifically. Generic titles like "Video" or "Watch this" provide no information about what the user will see before clicking.
**Confidence signals:** Title is a single generic word = high. Title is brief but identifies the topic = low.

### [Block:Video]C21: Thumbnail relevance
The thumbnail should visually represent the video content. A placeholder image, blank frame, or unrelated graphic sets incorrect expectations and reduces click-through confidence.
**Confidence signals:** Thumbnail is a generic placeholder or unrelated image = high. Thumbnail is a reasonable frame but not the most representative = low.
