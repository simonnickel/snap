@../conventions/index.md

# Agent Instructions

## Collaboration

- You are working with an experienced developer. Skip explanations of common patterns and concepts. Be direct.
- Ask before changing code. Propose first, implement after confirmation.
- Use Xcode MCP when relevant (building, running tests, checking errors).

## Scope

These are Swift library packages intended for arbitrary consumption (any app or package, unknown at the time of writing). Design decisions must hold up across a wide range of usage contexts.

- Unreleased. Changing public API is fine.
- The demo exists to verify integration, not to drive design. Never constrain or shape the API around how the demo uses it.
- Public API should be intuitive and hard to misuse. Prefer designs that make wrong usage a compile error over ones that fail at runtime.
- Avoid internal assumptions about the consumer's architecture, threading model or lifecycle.
- Prefer designing for how an API could be used over how it currently is used.

## Code Changes

- Match the scope of changes to what was asked. A bug fix doesn't need surrounding cleanup.
- Don't speculate beyond the task. The API should be general (see Scope) but implementations should be minimal.
- Don't add error handling or fallbacks beyond what the task requires.
- Default to writing no comments. See the Comments section for when and how.

## Comments

Comments are for developers exploring the package — not a changelog.

Write a comment when it helps understand design, usage or intent. That can include:
- Why a design was chosen over alternatives
- Non-obvious constraints or invariants
- Usage guidance for public API

Don't write comments that:
- Describe what the code does (naming should do that)
- Reference the task, fix or PR that introduced them
- Make specific claims about the current structure of a type, such as the number of cases or variants — they become wrong as it evolves

Don't remove existing TODO/FIXME comments unless explicitly asked to.

## Writing Style

These rules apply to all written text: code comments, documentation, AGENTS.md, README, skills, ...
- Prefer US spelling.
- Avoid writing open to misinterpretation.
- Avoid semicolons and dashes mid-sentence. Use a new sentence, conjunction, colon, comma, parentheses or rewording instead.
- When presenting multiple points, use a list rather than prose.
- No Oxford comma.

## Communication

- Keep responses concise.
- For exploratory questions, give a recommendation and the main tradeoff in 2–3 sentences. Don't implement until confirmed.
- Don't summarize what you just did at the end of a response.
- When proposing a change, show the file path, line number and a diff.

## Swift & SPM

- Swift 6 / strict concurrency. All changes must compile without warnings.
- Prefer `actor`, `@MainActor` or `OSAllocatedUnfairLock` for concurrency. Avoid `@unchecked Sendable` unless internal synchronization is in place and documented on the type.
- Tests use Swift Testing (`@Test`, `@Suite`), not XCTest.

## Agent Setup

Each package needs these files. Use the `check-agents-md` skill to create or update them:
- `CLAUDE.md` in the root containing only `@AGENTS.md` (what Claude Code auto-imports)
- `AGENTS.md` importing this file and extending it with package-specific context

Run `/context` to verify the agent setup is loaded correctly. If files you expect to be auto-imported are missing, tell the user before proceeding.

Skills live in `snap/agents/skills/`. After editing a skill, run `snap/agents/sync-skills.sh` to propagate changes to all destinations. When renaming a skill, manually remove the old folder from each destination (the sync script copies but does not clean up stale entries).

## Skill Conventions

Skills that present findings to the user follow this standard format:
- Show findings as a numbered list. For each item include the file name and line, the finding and a proposed change.
- Group and prioritise findings.
- Do not apply any changes until the user has reviewed the list.
- Suggest going through them one by one.
