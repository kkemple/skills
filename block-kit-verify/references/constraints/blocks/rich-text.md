# Rich Text Block Constraints

## Hard-reject constraints

### [Block:Rich Text]C01: Type value
The `type` field must be `"rich_text"`.

### [Block:Rich Text]C02: Elements required
The `elements` field is required and must be an array of rich text objects.

### [Block:Rich Text]C03: Elements allowed types
Each item in the `elements` array must have a `type` of `"rich_text_section"`, `"rich_text_list"`, `"rich_text_preformatted"`, or `"rich_text_quote"`.

### [Block:Rich Text]C04: rich_text_section elements required
A `rich_text_section` object must contain an `elements` array of rich text element objects.

### [Block:Rich Text]C05: rich_text_list style required
A `rich_text_list` object must contain a `style` field.

### [Block:Rich Text]C06: rich_text_list style values
The `style` field of a `rich_text_list` must be either `"bullet"` or `"ordered"`.

### [Block:Rich Text]C07: rich_text_list elements required
A `rich_text_list` object must contain an `elements` array.

### [Block:Rich Text]C08: rich_text_list elements type
Each item in the `elements` array of a `rich_text_list` must be a `rich_text_section` object.

### [Block:Rich Text]C09: rich_text_preformatted elements required
A `rich_text_preformatted` object must contain an `elements` array of rich text element objects.

### [Block:Rich Text]C10: rich_text_quote elements required
A `rich_text_quote` object must contain an `elements` array of rich text element objects.

### [Block:Rich Text]C11: Rich text element types
Rich text element objects (within `rich_text_section`, `rich_text_preformatted`, or `rich_text_quote`) must have a `type` of `"broadcast"`, `"color"`, `"channel"`, `"date"`, `"emoji"`, `"link"`, `"text"`, `"user"`, or `"usergroup"`.

### [Block:Rich Text]C12: broadcast range required
A `broadcast` element must contain a `range` field.

### [Block:Rich Text]C13: broadcast range values
The `range` field of a `broadcast` element must be `"here"`, `"channel"`, or `"everyone"`.

### [Block:Rich Text]C14: color value required
A `color` element must contain a `value` field with the hex value for the color.

### [Block:Rich Text]C15: channel channel_id required
A `channel` element must contain a `channel_id` field.

### [Block:Rich Text]C16: date timestamp required
A `date` element must contain a `timestamp` field (a Unix timestamp in seconds).

### [Block:Rich Text]C17: date format required
A `date` element must contain a `format` field (a template string with curly-brace-enclosed tokens).

### [Block:Rich Text]C18: emoji name required
An `emoji` element must contain a `name` field.

### [Block:Rich Text]C19: link url required
A `link` element must contain a `url` field.

### [Block:Rich Text]C20: text text required
A `text` element must contain a `text` field.

### [Block:Rich Text]C21: user user_id required
A `user` element must contain a `user_id` field.

### [Block:Rich Text]C22: usergroup usergroup_id required
A `usergroup` element must contain a `usergroup_id` field.

## Scored constraints
