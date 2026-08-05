@../conventions/index.md

# Agent Instructions

## Responses

- Keep responses concise.
- Don't summarize what you just did at the end of a response.

## Proposing changes

For open design questions, give the recommendation and the tradeoffs in the response first. Ask only once the decision is ready to be made, not while it is still being formed.

To ask, use the AskUserQuestion tool with whatever concrete choices fit the decision: a single proposal or several named alternatives. Always include an option to skip (leave unchanged).

Its text does not render markdown, so all content belongs in the response and the question only asks how to proceed.

## Diff previews

When presenting a current vs. proposed text or code change, use a fenced ```diff block (`-`/`+` lines) so it renders as a colored diff. Include the file path and line number.

## Presenting findings

When presenting a list of findings (proofreading, code review, audits, or any other multi-item task), show a numbered list, grouped and prioritized. Then use the AskUserQuestion tool to ask how to proceed. A typical shape is shown below, adjust it to fit the task:

- **One by one**: review and decide on each finding individually
  - Restate the proposal for that finding
  - If resolving it took discussion, ask before moving to the next one once that concludes
- **Apply all**: apply all suggested fixes at once
- **Skip all**: leave the content unchanged
