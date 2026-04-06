# Domain — Block Kit Design

Loaded by: Optimizer, Orchestrator

## Field

## Quality signals — from Designing with Block Kit

### Content clarity
- Use short, clear sentences and paragraphs
- Explain abbreviations
- Do not use jargon, buzzwords, idioms, or slang
- Do not use directional or sensory language, including emojis, to refer to other content (e.g., do not use an arrow to refer to a prior message)

### Color usage
- Use more than just color to convey meaning — color can enhance and reinforce meaning but should not be the only way to convey it (e.g., a red button that says "cancel" is insufficient; it should say "cancel subscription")
- Provide sufficient contrast for text and important visual indicators (4.5:1 ideal for regular text)
- Test in both light and dark mode

### Simplify with pictures
- Use image elements to reduce text where faces can replace names or maps can replace addresses
- Use context blocks for helpful information that isn't primary content (context blocks store text, images, and emoji)

### Interactivity reduces complexity
- Use interactive components to break workflows into steps
- Only show what's needed for the current step
- Let interaction choices reveal further information or options only when necessary
- Tuck advanced options away (e.g., overflow menus for lesser-used options)
- Streamline default interactivity to help users intuit the most important action

### Sensible default options
- Minimize choices by giving select menus and buttons good default values
- Reduce decisions from many to one (yes or no) where possible

### Cleanup after interaction
- Update messages after the interactive flow or conversation expires
- Condense to a short text record of what happened
- Remove buttons and menus that no longer need to stick around

### Screen reader considerations
- The top-level `text` field of a message is what screen readers default to — it will not read content from interior `blocks`
- Either include all necessary content for screen readers in the top-level `text` field, or omit the top-level `text` field to let Slack build it from supported blocks

### Emoji use
- Do not use emojis as controls, field labels, inline help, buttons, or workflow triggers — always pair with text
- Place emojis at the end of a sentence or line
- Use emojis sparingly in headers and append to end
- Use emojis either in the header or the subtext, but not both
- Emojis are not word replacements — pair with relevant text
- Do not use emojis as bullet points

### Images
- Provide clear, context-specific `alt_text` for all images, and `title` if appropriate
- Limit redundant and purely decorative images (each requires `alt_text` and will be read by screen readers)

### Animations
- Ensure meaning is conveyed even when paused (freeze frame or surrounding text should capture the main point)
- Include descriptive `alt_text`
- Do not add more than three large flashes per second (WCAG standard)

### Charts
- Every visually displayed chart needs an accompanying accessible PDF
- Include an image block with chart screenshot and brief `alt_text` (e.g., "chart preview")
- Include a button for downloading the chart as an accessible PDF
- PDF must be in PDF/UA format with a properly-tagged table version of the data

### Input fields
- Wrap inputs in input blocks
- Provide associated labels for all input fields
- Use descriptive placeholder text for selects
- Do not wrap inputs in section or action blocks
- Do not use emojis in input labels

### Repetitive controls in lists
- Give buttons brief, repetitive labels to avoid truncation
- Make placeholder text for inputs record-specific where possible
- Screen readers will read entire placeholder text but button text will be cut off if truncated — prioritize brevity on buttons
