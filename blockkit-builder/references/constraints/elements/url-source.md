# URL Source Element Constraints

## Hard-reject constraints

### [Element:URL Source]C01: Type value
The `type` field must be `"url"`.

### [Element:URL Source]C02: URL required
The `url` field is required and must be a string.

### [Element:URL Source]C03: Text required
The `text` field is required and must be a string.

## Scored constraints

### [Element:URL Source]C10: URL is relevant to the task
The referenced URL should directly support the task card's action or purpose. A URL that links to unrelated content confuses users and degrades trust in the interface.
**Confidence signals:** URL points to a generic page, unrelated resource, or placeholder like "https://example.com" = high issue confidence. URL links to a resource that directly supports the task at hand = low issue confidence.
