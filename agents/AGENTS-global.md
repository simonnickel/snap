# Agent Instructions

## Asking questions

Use the AskUserQuestion tool when it fits — e.g. offering a proposal with Apply/Adjust/Skip, or presenting concrete options for the user to choose from:

- **Apply** — use the proposal as-is
- **Adjust** — discuss and refine the proposal before applying
- **Skip** — leave this unchanged

## Presenting findings

Whenever presenting a list of findings (proofreading, code review, audits, or any other multi-item review), use the AskUserQuestion tool — not a plain-text question — to ask how to proceed:

- **One by one** — review and decide on each finding individually
- **Apply all** — apply all suggested fixes at once
- **Skip all** — leave the content unchanged

If the user selects **One by one**, always use AskUserQuestion per finding, as described above.
