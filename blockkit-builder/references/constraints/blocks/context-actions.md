# Context Actions Block Constraints

## Hard-reject constraints

### [Block:Context Actions]C01: Type value
The `type` field must be `"context_actions"`.

### [Block:Context Actions]C02: Elements required
The `elements` field is required and must be an array.

### [Block:Context Actions]C03: Elements allowed types
Each item in the `elements` array must be a feedback buttons element or an icon button element.

### [Block:Context Actions]C04: Elements max items
The `elements` array must not contain more than 5 items.

## Scored constraints

### [Block:Context Actions]C10: Feedback relevance
Feedback buttons should relate directly to the content they accompany. Placing generic or unrelated feedback options alongside content creates confusion about what is being rated.
**Confidence signals:** Feedback buttons with no logical connection to the preceding content = high. Slightly broad feedback scope = low.

### [Block:Context Actions]C11: Icon clarity
Icon buttons should have a clear, self-evident purpose without requiring text explanation. If a user cannot infer the action from the icon alone, a labeled button or tooltip is a better choice.
**Confidence signals:** Ambiguous or generic icon with no alt text = high. Well-known icon with minor ambiguity = low.
