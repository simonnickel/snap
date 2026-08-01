# Agent Instructions

## Proposing changes

When proposing a change, use the AskUserQuestion tool with whatever concrete choices fit the decision: a single proposal, or several named alternatives. Always include an option to skip (leave unchanged).

## Presenting findings

When presenting a list of findings (proofreading, code review, audits, or any other multi-item review), use the AskUserQuestion tool to ask how to proceed. A typical shape:

- **One by one** — review and decide on each finding individually
  - Restate the proposal for that finding
  - Ask before moving to the next one
- **Apply all** — apply all suggested fixes at once
- **Skip all** — leave the content unchanged

Adjust to fit the review.
