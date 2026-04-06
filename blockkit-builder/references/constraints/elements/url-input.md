# URL Input Element Constraints

## Hard-reject constraints

### [Element:URL Input]C01: Type value
The `type` field must be `"url_text_input"`.

### [Element:URL Input]C02: Placeholder type
The `placeholder` field, if present, must be a `plain_text` text object only.

### [Element:URL Input]C03: Placeholder text max length
The `text` value of the `placeholder` object must not exceed 150 characters.

## Scored constraints

### [Element:URL Input]C10: Placeholder shows expected URL pattern
Placeholder text should hint at the type of URL expected (e.g., "https://github.com/org/repo", "https://example.com/page"), helping users understand what kind of link to provide.
**Confidence signals:** No placeholder or placeholder that just says "Enter URL" with no hint about the expected domain or pattern = high issue confidence. Placeholder showing a realistic example URL matching the expected type = low issue confidence.
