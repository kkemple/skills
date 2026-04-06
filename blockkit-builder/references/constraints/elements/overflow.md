# Overflow Menu Element Constraints

## Hard-reject constraints

### [Element:Overflow Menu]C01: Type value
The `type` field must be `"overflow"`.

### [Element:Overflow Menu]C02: Options required
The `options` field is required.

### [Element:Overflow Menu]C03: Options max items
The `options` array must not contain more than 5 option objects.

### [Element:Overflow Menu]C04: Options item type
Each item in `options` must be an option object.

### [Element:Overflow Menu]C05: Confirm type
The `confirm` field, if present, must be a confirmation dialog object.

## Scored constraints

### [Element:Overflow Menu]C10: Options are meaningful secondary actions
Overflow menus should contain genuinely secondary actions. Primary or frequently used actions should be surfaced as visible buttons, not hidden inside an overflow menu where users may not find them.
**Confidence signals:** The primary action for the context is buried in the overflow menu, or all actions are in overflow with nothing visible = high issue confidence. Only supplementary or less-common actions placed in the overflow = low issue confidence.

### [Element:Overflow Menu]C11: Option count is appropriate
An overflow menu with only 1 option should likely be a button instead, since the menu adds an extra click with no benefit. Conversely, the menu should not be used as a dumping ground for unrelated actions.
**Confidence signals:** Overflow with a single option, or options that serve unrelated purposes grouped together = high issue confidence. 2-5 related secondary actions = low issue confidence.
