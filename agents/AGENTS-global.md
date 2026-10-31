@../docs/documentation.md

@../docs/conventions/index.md

# Agent Instructions

## Responses

- Don't explain common patterns, language features or tooling.
- Quote file content verbatim as a blockquote, so it stands out from the response.

## Asking questions

Ask in the response, not with the AskUserQuestion tool, since the content before it is often not posted.

- Ask only once the decision is ready to be made, not while it is still being formed.
- Give the recommendation and the tradeoffs first.
- End the response with the choices as a numbered list, so the user can answer with a number. After a numbered list of findings, use letters instead.
- Include an option to skip (leave unchanged).

## Diff previews

When presenting a current vs. proposed text or code change, use a fenced ```diff block (`-`/`+` lines) so it renders as a colored diff. Include the file path and line number.

## Checking content

When checking written content (documentation, comments, AGENTS.md, README, skills and similar), look for the following.

### Each file

- Spelling: typos and misspelled words
- Wording: issues against `writing-style.md`
- Misplaced: content that belongs in another file
- Redundant: content already covered elsewhere

### Against the source

When content describes code or another source:

- Missing: content the source calls for that the file lacks
- Outdated: claims, symbols, paths, code samples or links that no longer match the source

### Across files

When several files are checked together:

- Duplication: the same content in more than one place
- Overlap: content or workflows that partly cover the same topic
- Contradictions: statements that disagree
- Inconsistent terms: one concept named differently

## Presenting findings

When presenting a list of findings (proofreading, code review, audits or any other multi-item task), show a numbered list, grouped and prioritized. Then ask how to proceed. A typical shape is shown below. Adjust it to fit the task:

- **One by one**: review and decide on each finding individually
  - Restate the proposal for that finding
  - Ask explicitly before moving to the next finding
- **Apply all**: apply all suggested fixes at once
- **Skip all**: leave the content unchanged

## Tools

- Use Xcode MCP when working on an Xcode project (building, running tests, checking errors).
- When a tool fails because of a one-time environment fix (e.g. `xcode-select` points to CLT, missing simulator platform), surface it instead of silently working around it.
