@../docs/documentation.md

@../docs/conventions/index.md

# Agent Instructions

## Responses

- Don't explain common patterns, language features or tooling.
- Quote file content verbatim as a blockquote, so it stands out from the response.
- Say when uncertain. A wrong answer is worse than an incomplete one.
- Question assumptions in a request or design that look wrong, and explain why.

## Asking questions

Ask in the response, not with the AskUserQuestion tool, since the content before it is often not posted.

- Ask only once the decision is ready to be made, not while it is still being formed.
- Give the recommendation and the tradeoffs first.
- End the response with the choices as a numbered list, so the user can answer with a number. After a numbered list of findings, use letters instead.
- Include an option to skip (leave unchanged).

## Diff previews

- When proposing a text or code change before applying it, use a fenced ```diff block (`-`/`+` lines) so it renders as a colored diff.
- Put the file path above the block. Start the block with a hunk header (`@@ -23,1 +23,2 @@`) for the line numbers.
- After applying a change, don't repeat it as a diff. The edit is already shown. Summarize only what the edit does not show, such as reasons or what was left out.

## Checking content

When checking written content (documentation, comments, AGENTS.md, README, skills and similar), look for the following.

### Each file

- Language: typos, misspelled words and grammatical errors
- Wording: issues against `writing-style.md`
- Leftovers: placeholder text or unresolved markers
- Conventions: code samples that violate them
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

- **One by one**: review and decide on each finding individually, as described below
- **Apply all**: apply all suggested fixes at once
- **Skip all**: leave the content unchanged

### One by one

- Present one finding per reply, starting with its position, e.g. "Finding 3 of 7".
- Restate the finding and propose a fix. Mention when an earlier fix already changed it.
- Resolve it completely: apply the fix, answer follow-up questions and verify the change.
- Commit only its changes before moving on. Skip the commit when nothing changed.
- End each reply by offering to commit and continue with the next finding, or to keep working on the current one. Never start the next finding unasked.

## Recurring actions

Before the first commit, build or test run of a session, ask how to handle that action for the rest of the session:

- Automatically
- Ask each time
- Never

A direct request overrides the choice.

## Tools

- Use Xcode MCP when working on an Xcode project (building, running tests, checking errors).
- When a tool fails because of a one-time environment fix (e.g. `xcode-select` points to CLT, missing simulator platform), surface it instead of silently working around it.
