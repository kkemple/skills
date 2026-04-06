# Actions Block Constraints

## Hard-reject constraints

### [Block:Actions]C01: Type value
The `type` field must be `"actions"`.

### [Block:Actions]C02: Elements required
The `elements` field is required and must be an array of interactive element objects.

### [Block:Actions]C03: Elements max items
The `elements` array must not contain more than 25 elements.

### [Block:Actions]C04: Elements allowed types
Each item in `elements` must be one of: button, select menu, overflow menu, or date picker.

## Scored constraints

### [Block:Actions]C10: Element grouping coherence
Related actions should be grouped together rather than interleaved with unrelated actions.
**Confidence signals:** Actions for completely different workflows in one block = high. Minor ordering preference = low.

### [Block:Actions]C11: Action count proportional to context
Although 25 elements are allowed, most action blocks should contain 3-5 elements. A large number of actions increases cognitive load and suggests the UI should be split across multiple messages or surfaces.
**Confidence signals:** More than 10 actions with no clear justification = high. 6-8 actions in a complex workflow = low.
