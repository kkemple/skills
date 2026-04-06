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
