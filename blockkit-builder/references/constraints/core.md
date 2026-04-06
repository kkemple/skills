# Core Constraints — Block Kit Builder

## Hard-reject constraints

### C01: Valid JSON with blocks array
The payload must be valid JSON containing a `blocks` field whose value is an array. Each item in the array is a block object.

### C02: Every block must have a type field
Every block object in the `blocks` array must contain a `type` field specifying which block type it is.

### C03: Messages — max 50 blocks
A message surface must not contain more than 50 blocks in the `blocks` array.

### C04: Modals and Home tabs — max 100 blocks
A modal or Home tab surface must not contain more than 100 blocks in the `blocks` array.

### C05: block_id max length
If a `block_id` is provided on any block, it must not exceed 255 characters.

### C06: block_id uniqueness
Each `block_id` within a single payload must be unique. When a message is updated, new `block_id` values should be used.

### C07: action_id max length
If an `action_id` is provided on any interactive element, it must not exceed 255 characters.

### C08: action_id uniqueness within a block
Each `action_id` must be unique among all other `action_id` values in the containing block.

### C09: Surface compatibility
Blocks must only be used in surfaces where they are supported. Not all block types are compatible with all surfaces (messages, modals, Home tabs).

### C10: Three valid surfaces
Block Kit layouts can only be rendered in one of three surfaces: messages, modals, or Home tabs.