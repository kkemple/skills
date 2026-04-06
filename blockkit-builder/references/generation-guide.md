# Generation Guide — Block Kit

Loaded by: Generator

## Interview protocol (interactive mode)

### Question flow

Start broad, narrow based on answers. Never dump all questions at once.

**Round 1 — Goal and surface:**
- "What is this UI for?" / "What experience are you building?"
- Listen for keywords that map to patterns (see Goal-to-pattern mapping below)
- If surface is ambiguous, ask: "Will this appear as a message, a modal dialog, or on the App Home tab?"

**Round 2 — Content and structure:**
- "What information needs to appear?" / "What data are you showing?"
- "Is any of this dynamic (from an API, user input, etc.)?"
- "Do you need images, links, or formatted text?"

**Round 3 — Interaction:**
- "What should the user be able to do?" / "Are there actions or inputs?"
- "Do any actions need confirmation before executing?"

Skip rounds when the user has already provided the information. If the user gives you everything upfront ("I need an approval message with requester info and approve/deny buttons"), go straight to the UI plan.

### Goal-to-pattern mapping

| Goal keywords | Pattern | Typical surface |
|--------------|---------|-----------------|
| "display data", "show results", "dashboard", "metrics" | Dashboard / data display | Message or Home tab |
| "table", "list", "rows" | Tabular data display | Message |
| "status", "notification", "alert", "update" | Status notification | Message |
| "approval", "approve", "review", "sign off" | Approval workflow | Message |
| "form", "collect", "input", "survey", "feedback" | Input form | Modal |
| "settings", "preferences", "configuration" | Settings panel | Home tab or Modal |
| "onboarding", "welcome", "getting started" | Onboarding flow | Home tab |
| "confirm", "are you sure", "verify action" | Confirmation dialog | Modal |
| "pick", "choose", "select from" | Selection interface | Modal or Message |

## Block types

All 15 block types and their surface compatibility. Every block the Generator produces must be from this list.

| Block | Description | Surfaces |
|-------|-------------|----------|
| **actions** | Holds multiple interactive elements (buttons, selects, date pickers, etc.) | Modals, Messages, Home tabs |
| **context** | Provides contextual info — images and text | Modals, Messages, Home tabs |
| **context_actions** | Displays actions as contextual info — feedback buttons and icon buttons | Messages only |
| **divider** | Visually separates pieces of info | Modals, Messages, Home tabs |
| **file** | Displays info about remote files | Messages only |
| **header** | Displays larger-sized text | Modals, Messages, Home tabs |
| **image** | Displays a standalone image | Modals, Messages, Home tabs |
| **input** | Collects information from users via elements | Modals, Messages, Home tabs |
| **markdown** | Displays formatted markdown | Messages only |
| **plan** | Displays a collection of related tasks | Messages only |
| **rich_text** | Displays formatted, structured representation of text | Modals, Messages, Home tabs |
| **section** | Displays text, possibly alongside elements (accessory) | Modals, Messages, Home tabs |
| **table** | Displays structured information in a table | Messages only |
| **task_card** | Displays a single task, representing a single action | Messages only |
| **video** | Displays an embedded video player | Modals, Messages, Home tabs |

## Element types

All 20 element types, which blocks they can appear in, and surface compatibility.

| Element | Description | Blocks | Surfaces |
|---------|-------------|--------|----------|
| **button** | Direct path to performing basic actions | Section, Actions | Modals, Messages, Home tabs |
| **checkboxes** | Choose multiple items from a list | Section, Actions, Input | Modals, Messages, Home tabs |
| **datepicker** | Select a date from a calendar UI | Section, Actions, Input | Modals, Messages, Home tabs |
| **datetime_picker** | Select both a date and time of day | Actions, Input | Modals, Messages |
| **email_input** | Enter an email into a single-line field | Input | Modals only |
| **feedback_buttons** | Indicate positive or negative feedback | Context actions | Messages only |
| **file_input** | Upload files | Input | Modals only |
| **icon_button** | Icon button to perform actions | Context actions | Messages only |
| **image** | Displays an image as part of a larger block | Section, Context | Modals, Messages, Home tabs |
| **multi_select_menu** | Select multiple items from a list | Section, Actions, Input | Modals, Messages, Home tabs |
| **number_input** | Enter a number into a single-line field | Input | Modals only |
| **overflow** | Press a button to view a list of options | Section, Actions | Modals, Messages, Home tabs |
| **plain_text_input** | Enter freeform text (single-line or multi-line) | Input | Modals, Messages, Home tabs |
| **radio_buttons** | Choose one item from a list of options | Section, Actions, Input | Modals, Messages, Home tabs |
| **rich_text_input** | Enter formatted text in a WYSIWYG composer | Input, Table | Modals, Home tabs |
| **select_menu** | Choose an option from a drop down menu | Section, Actions, Input | Modals, Messages, Home tabs |
| **timepicker** | Select a time | Section, Actions, Input | Modals, Messages, Home tabs |
| **url_input** | Enter a URL into a single-line field | Input | Modals only |
| **url_source** | Displays a URL source for referencing | Task card | Messages only |
| **workflow_button** | Run a link trigger with customizable inputs | Section, Actions | Messages only |

## Surface selection heuristics

| Surface | When to use | Limits |
|---------|-------------|--------|
| **Message** | Default. Notifications, alerts, status updates, content display, simple interactions. All block types available. | Max 50 blocks |
| **Modal** | Collecting structured input (forms), multi-step workflows, confirmation dialogs. Input blocks allowed. Built-in submit/cancel. Requires title and submit label. | Max 100 blocks |
| **Home tab** | Persistent dashboards, settings panels, onboarding flows, app landing pages. | Max 100 blocks |

**Message-only blocks:** context_actions, file, markdown, plan, table, task_card
**Modal-only elements:** email_input, file_input, number_input, url_input

## Requirement mapping

How to translate user descriptions into block/element choices.

| User says | Block Kit translation |
|-----------|---------------------|
| "list of items" | Section blocks with fields, or multiple section blocks |
| "form" / "collect input" | Input blocks with appropriate elements in a modal surface |
| "buttons" / "actions" | Actions block with button elements |
| "menu" / "dropdown" | Section with select_menu accessory, or input block with select_menu |
| "notification" / "alert" | Header + section + context for message surface |
| "dashboard" / "status" / "metrics" | Multiple section blocks with fields, header blocks for grouping |
| "approval" / "confirm" / "sign off" | Section with description + actions block with approve/deny buttons |
| "image" / "picture" | Image block (standalone) or image element (as section accessory) |
| "divider" / "separator" | Divider block between logical groups |
| "date picker" | Datepicker element in input block (modal) or section accessory (message) |
| "time picker" | Timepicker element in input block (modal) or section accessory (message) |
| "date and time" / "schedule" | Datetime_picker element in actions or input block |
| "text input" / "free text" | Input block with plain_text_input element |
| "number" / "quantity" / "amount" | Input block with number_input element (modal only) |
| "email" / "email address" | Input block with email_input element (modal only) |
| "URL" / "link input" / "website" | Input block with url_input element (modal only) |
| "file upload" / "attach file" | Input block with file_input element (modal only) |
| "multi-select" / "pick multiple" | Input or section with multi_select_menu element |
| "checkboxes" / "check all that apply" | Input or section with checkboxes element |
| "radio buttons" / "pick one from list" | Input or section with radio_buttons element |
| "rich text" / "formatted text" | Rich text block with rich_text_section elements |
| "rich text editor" / "compose message" | Input block with rich_text_input element (modal/Home tab) |
| "video" / "embed video" | Video block with title, thumbnail, and URL |
| "overflow menu" / "more options" | Overflow element as section accessory or in actions block |
| "table" / "structured data" / "rows and columns" | Table block (messages only) |
| "task" / "to-do" / "action item" | Task_card block (messages only) |
| "project plan" / "task list" / "checklist" | Plan block with task items (messages only) |
| "file" / "shared file" | File block referencing a remote file (messages only) |
| "formatted markdown" | Markdown block (messages only) |
| "feedback" / "thumbs up/down" / "rate this" | Context_actions block with feedback_buttons (messages only) |
| "icon action" / "small button" | Context_actions block with icon_button (messages only) |
| "trigger workflow" / "run workflow" | Workflow_button element in section or actions (messages only) |

## Common patterns

### Status notification (message)

```
header       → status title
section      → details (mrkdwn text), optional accessory (image, button)
context      → timestamp, metadata, source info
[optional]   → actions block with follow-up buttons
```

### Input form (modal)

```
section      → explanatory intro text
input        → first field (text input, select, date picker, etc.)
input        → second field
section      → explanatory text between groups (if needed)
input        → more fields
[no actions] → modal submit handles form submission
```

### Dashboard card (Home tab)

```
header       → dashboard title
section      → key-value data using fields
divider      → between logical groups
section      → more key-value data
actions      → quick action buttons
```

### Approval request (message)

```
section      → request details (mrkdwn), requester avatar as accessory
context      → requester name, timestamp, priority
actions      → approve button (style: primary) + deny button (style: danger)
```

### Settings panel (Home tab)

```
header       → settings title
section      → setting description with toggle/select accessory
divider
section      → another setting with accessory
actions      → save/reset buttons
```

### Data table (message)

```
header       → table title
table        → structured rows and columns with typed cells
context      → row count, last updated, source
```

### Task tracking (message)

```
plan         → collection of related task_card blocks
```

Or for a single task:

```
task_card    → single action item with url_source for reference
context      → assignee, due date, priority
```

### Feedback collection (message)

```
section      → content to get feedback on
context_actions → feedback_buttons (thumbs up/down) + icon_button actions
```

### File sharing (message)

```
section      → description or context about the file
file         → remote file reference (uses external_id)
```

### Workflow trigger (message)

```
section      → description of what the workflow does
actions      → workflow_button to run the link trigger
```

## Auto mode — input analysis

When processing input without user interaction:

1. **API response / JSON data** — Identify the data shape. Map keys to labels, values to content. Choose tabular (fields) for flat key-value data, nested sections for hierarchical data. Default to message surface.

2. **Plain text description** — Extract goal keywords (see Goal-to-pattern mapping). Map to the closest pattern. Produce directly.

3. **Specification / wireframe description** — Map structural descriptions directly to block types. Honor any surface or element preferences stated in the spec.

If the input is ambiguous in auto mode, make a reasonable choice and document it in assumptions. Do not ask questions.

## Production principles

1. **Start simple.** Use the fewest blocks that fulfill the requirement. Add complexity only when demanded.
2. **Prefer section blocks for content.** They are the most flexible — text, fields, accessories.
3. **Use header blocks for visual hierarchy.** One header per logical group, not per block.
4. **Group related content in single blocks.** Use section fields for key-value pairs rather than separate blocks per pair.
5. **Context blocks are for metadata.** Timestamps, source info, secondary details — not primary content.
6. **Interactive elements need clear labels.** Action-oriented text: "Approve", "View details", "Select a date" — not "Click here" or "Submit".
7. **Every image needs alt_text.** Every input needs a label. No exceptions.
8. **Include block_id when blocks will be updated.** If the user will need to reference or update specific blocks programmatically, include block_ids. Otherwise omit them.
9. **Include action_id on all interactive elements.** Required for handling interactions. Use descriptive IDs: `approve_request`, `select_priority`, not `action_1`.
10. **When in doubt about surface, default to message.** It's the most common and least constrained interaction model.
