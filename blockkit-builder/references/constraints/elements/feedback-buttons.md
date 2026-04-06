# Feedback Buttons Element Constraints

## Hard-reject constraints

### [Element:Feedback Buttons]C01: Type value
The `type` field must be `"feedback_buttons"`.

### [Element:Feedback Buttons]C02: positive_button required
The `positive_button` field is required.

### [Element:Feedback Buttons]C03: negative_button required
The `negative_button` field is required.

### [Element:Feedback Buttons]C04: positive_button text required and type
The `positive_button.text` field is required and must be a text object with `type: plain_text`.

### [Element:Feedback Buttons]C05: positive_button text max length
The `positive_button.text` text must not exceed 75 characters.

### [Element:Feedback Buttons]C06: negative_button text required and type
The `negative_button.text` field is required and must be a text object with `type: plain_text`.

### [Element:Feedback Buttons]C07: negative_button text max length
The `negative_button.text` text must not exceed 75 characters.

### [Element:Feedback Buttons]C08: positive_button value required and max length
The `positive_button.value` field is required. Maximum length is 2000 characters.

### [Element:Feedback Buttons]C09: negative_button value required and max length
The `negative_button.value` field is required. Maximum length is 2000 characters.

### [Element:Feedback Buttons]C10: positive_button accessibility_label max length
If present, `positive_button.accessibility_label` must not exceed 75 characters.

### [Element:Feedback Buttons]C11: negative_button accessibility_label max length
If present, `negative_button.accessibility_label` must not exceed 75 characters.

### [Element:Feedback Buttons]C12: action_id max length
If present, `action_id` must not exceed 255 characters.

### [Element:Feedback Buttons]C13: Parent block
The feedback buttons element must be used inside a `context_actions` block.

## Scored constraints

### [Element:Feedback Buttons]C20: Feedback is contextually relevant
Feedback buttons should appear adjacent to or within the same view as the content being evaluated. Orphaned feedback buttons with no clear connection to a piece of content reduce signal quality.
**Confidence signals:** Feedback buttons placed with no nearby content to evaluate, or in a generic location disconnected from any specific output = high issue confidence. Feedback buttons placed directly after or alongside the content they rate = low issue confidence.
