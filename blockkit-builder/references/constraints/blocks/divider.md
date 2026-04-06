# Divider Block Constraints

## Hard-reject constraints

### [Block:Divider]C01: Type value
The `type` field must be `"divider"`.

## Scored constraints

### [Block:Divider]C10: Placement adds structure
Dividers should separate logical groups of content. Placing dividers at the very start or end of a layout, or between every consecutive block, adds visual noise without improving readability.
**Confidence signals:** Divider as first/last block or between every block = high. Divider between two closely related blocks where grouping is debatable = low.
