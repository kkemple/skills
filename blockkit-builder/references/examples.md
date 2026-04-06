# Examples — Block Kit Coherence Patterns

Loaded by: Optimizer, Generator

Real-world Block Kit examples live in `assets/blockkit-examples/block-kit-json/`. This file distills the patterns they demonstrate. When assessing coherence or generating artifacts, these patterns define what "good" looks like.

## Information architecture

Good Block Kit follows a consistent flow: **summary → details → actions → metadata**.

- **Summary** at top: header block or lead section with the key message
- **Details** in middle: sections with text, fields, or image accessories
- **Actions** after details: grouped in actions blocks, primary action styled
- **Metadata** at bottom: context blocks for timestamps, attribution, secondary info

Examples: `approval.json`, `pull-request.json`, `llm-response.json`

## Structural coherence signals

### Dividers segment related content
Dividers separate logical groups — not every block. A divider between each item in a list is good. A divider between every block is noise.

Examples: `search-results.json` (divider between each result), `newsletter.json` (divider between content sections)

### Repeating patterns are consistent
When multiple items share a structure (search results, task lists, poll options), every item should use the same block/element pattern. Inconsistent repetition is a coherence failure.

Examples: `actionable-summary.json` (each item: section + static_select accessory), `search-results-with-poll.json` (each result: section + image accessory + divider)

### Headers establish groups, not individual blocks
Header blocks mark the start of a logical section (dashboard panel, content group). Using a header before every section block is over-structuring.

Examples: `data-viz-bar-chart.json`, `task-list.json`

### Context blocks hold metadata, not primary content
Context blocks are for timestamps, attributions, source info, and secondary details. Primary content belongs in section blocks.

Examples: `pull-request.json` (creator avatar + timestamp in context), `notification.json` (schedule details in context)

## Element usage signals

### Accessories complement, not compete
Section accessories (images, buttons, selects) should support the section text, not introduce unrelated content. An image accessory should illustrate what the text describes. A button accessory should be the natural action for that section's content.

Examples: `approval-with-image.json` (image shows what's being approved), `search-results.json` (image shows the hotel)

### Fields for structured key-value data
When showing 2+ label-value pairs, use section fields rather than separate sections. Fields create compact, scannable layouts.

Examples: `approval.json` (type, when, hours in fields), `generated-image.json` (model, size, style in fields)

### Button styling conveys intent
- `primary` for the recommended/main action
- `danger` for destructive or irreversible actions
- Unstyled for secondary actions

Never use `primary` on more than one button per actions block. Never use `danger` for non-destructive actions.

Examples: `approval.json` (Approve = primary, Deny = danger), `deploy-preview.json` (View = primary)

### Emoji for status, not decoration
Emoji work well as status indicators (✅ complete, 🔄 in progress, ⚠️ warning) and data visualization (colored squares for bar charts). Emoji as bullet points, random decoration, or word replacements degrades coherence.

Examples: `task-list.json` (✅/🔄/⬜ for task states), `data-viz-bar-chart.json` (🟦 for bar segments)

## Surface-specific patterns

### Messages (most examples)
- Notifications: section + context + optional actions (`notification.json`)
- Approvals: section + fields + actions with approve/deny (`approval.json`)
- Search results: repeating section + image + divider + pagination actions (`search-results.json`)
- Polls: section per option + button per option + context for vote counts (`poll.json`)

### Home tabs / dashboards
- Data visualization: header + context + emoji charts + fields for metrics (`data-viz-*.json`)
- Task tracking: header + sections with emoji status + context for timing (`task-list.json`)

### DMs / onboarding
- Minimal, conversational: few sections, clear single CTA (`onboarding-lite.json`)
- Walkthrough: narrative sections + images + select + action buttons (`onboarding.json`)

## Anti-patterns (coherence failures)

These patterns indicate the artifact is structurally valid but not fit for purpose:

1. **Wall of text**: Section text exceeding 3-4 lines without breaking into multiple sections or using fields
2. **Orphaned actions**: Actions block with no preceding content explaining what the actions do
3. **Metadata as content**: Context blocks holding primary information that belongs in sections
4. **Inconsistent lists**: Repeating items that use different block structures for the same kind of content
5. **Button overload**: Actions block with more than 4-5 buttons, making choices unclear
6. **Missing hierarchy**: Flat sequence of sections with no headers, dividers, or context to create visual grouping
7. **Decoration noise**: Emoji used as bullets, in every header, or without conveying meaning
8. **Redundant accessories**: Image accessories that don't add information (generic icons, stock photos)
9. **Buried CTA**: Primary action hidden at the top or middle instead of after the relevant content
10. **Over-structuring**: Headers before every section, dividers between every block, or context blocks after every section
