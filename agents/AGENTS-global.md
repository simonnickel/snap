@../conventions/index.md

# Agent Instructions

## Responses

- Keep responses concise.
- Don't summarize what you just did at the end of a response.
- Don't explain common patterns, language features or tooling.

## Proposing changes

Propose changes first, implement after confirmation.

For open design questions, give the recommendation and the tradeoffs in the response first. Ask only once the decision is ready to be made, not while it is still being formed.

To ask, use the AskUserQuestion tool with whatever concrete choices fit the decision: a single proposal or several named alternatives. Always include an option to skip (leave unchanged).

Its text does not render markdown, so all content belongs in the response and the question only asks how to proceed.

## Diff previews

When presenting a current vs. proposed text or code change, use a fenced ```diff block (`-`/`+` lines) so it renders as a colored diff. Include the file path and line number.

## Presenting findings

When presenting a list of findings (proofreading, code review, audits, or any other multi-item task), show a numbered list, grouped and prioritized. Then use the AskUserQuestion tool to ask how to proceed. A typical shape is shown below, adjust it to fit the task:

- **One by one**: review and decide on each finding individually
  - Restate the proposal for that finding
  - Ask explicitly before moving to the next finding
- **Apply all**: apply all suggested fixes at once
- **Skip all**: leave the content unchanged

## Tools

- Use Xcode MCP when working on an Xcode project (building, running tests, checking errors).
- When a tool fails because of a one-time environment fix (e.g. `xcode-select` points to CLT, missing simulator platform), surface it instead of silently working around it.
