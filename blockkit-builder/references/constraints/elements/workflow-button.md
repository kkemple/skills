# Workflow Button Element Constraints

## Hard-reject constraints

### [Element:Workflow Button]C01: Type value
The `type` field must be `"workflow_button"`.

### [Element:Workflow Button]C02: Text required
The `text` field is required and must be a text object.

### [Element:Workflow Button]C03: Text type
The `text` field must be of `type: plain_text`. No other text type is allowed.

### [Element:Workflow Button]C04: Text max length
The `text` field must not exceed 75 characters.

### [Element:Workflow Button]C05: Workflow required
The `workflow` field is required and must be a workflow object containing details about the workflow that will run when the button is clicked.

### [Element:Workflow Button]C06: Style values
If present, the `style` field must be one of `"primary"` or `"danger"`.

### [Element:Workflow Button]C07: Accessibility label max length
If present, the `accessibility_label` field must not exceed 75 characters.

## Scored constraints

### [Element:Workflow Button]C10: Label describes the triggered workflow
Button text should make clear what workflow will run when clicked (e.g., "Start onboarding", "Run deploy check"), not use vague labels like "Go" or "Run workflow".
**Confidence signals:** Generic label like "Run", "Go", "Start" with no indication of which workflow fires = high issue confidence. Label that names or clearly implies the specific workflow being triggered = low issue confidence.
