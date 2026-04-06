# Context Block Constraints

## Hard-reject constraints

### [Block:Context]C01: Type value
The `type` field must be `"context"`.

### [Block:Context]C02: Elements required
The `elements` field is required and must be present.

### [Block:Context]C03: Elements max items
The `elements` array must not contain more than 10 items.

### [Block:Context]C04: Elements allowed types
Each item in `elements` must be an image element or a text object (`mrkdwn` or `plain_text`).

## Scored constraints

### [Block:Context]C10: Content is genuinely metadata
Context blocks should hold secondary information such as timestamps, attributions, or status indicators. Primary content belongs in section or rich text blocks, not context blocks.
**Confidence signals:** Main message content placed in a context block = high. Borderline supplementary info = low.

### [Block:Context]C11: Element count appropriate
Although 10 elements are allowed, most context blocks need only 2-3 elements. Overloading a context block dilutes the secondary-information signal and clutters the layout.
**Confidence signals:** More than 5 elements with no clear reason = high. 4 elements with distinct metadata fields = low.
