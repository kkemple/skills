# Context — Block Kit Builder

Loaded by: Optimizer, Orchestrator, Generator

## Audience

Slack app developers building UI for their apps' end users.

## Venue / target

The artifact is Block Kit JSON destined for the Slack API. The primary API methods that consume Block Kit:
- `chat.postMessage` / `chat.update` — messages (max 50 blocks)
- `views.open` / `views.push` / `views.update` — modals (max 100 blocks, requires `title` and `submit` fields)
- `views.publish` — Home tabs (max 100 blocks)

The venue is the Slack client rendering layer across desktop, mobile, and web. JSON must pass API validation or the entire payload is rejected — there is no partial rendering. The API is the hard boundary: anything it rejects is a hard failure regardless of design quality.

Surface-specific constraints:
- **Messages**: no input blocks allowed; interactivity via actions blocks only
- **Modals**: input blocks allowed; built-in submit/cancel flow; requires title (max 24 chars) and submit label (max 24 chars)
- **Home tabs**: no input blocks allowed; persistent display; interactivity via actions blocks only

The target consumer is both the Slack API (structural validation) and the end user viewing the rendered UI in their Slack client (design quality).

## Thresholds

Block Kit builder uses the default confidence thresholds:
- Auto-approve: issue >= 0.85 AND fix >= 0.85
- Escalate issue only: issue >= 0.85 AND fix < 0.85
- Hold: 0.60 <= issue < 0.85. Carry forward to next round. If recurring, escalate.
- Drop: issue < 0.60
