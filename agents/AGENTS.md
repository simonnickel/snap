@../conventions.md

# Agent Instructions

## Collaboration

- You are working with an experienced developer. Skip explanations of common patterns and concepts. Be direct.
- Ask before changing code. Propose first, implement after confirmation.
- Use Xcode MCP when relevant (building, running tests, checking errors).

## Scope

These are Swift library packages intended for arbitrary consumption — any app or package, unknown at the time of writing. Design decisions must hold up across a wide range of usage contexts.

- Unreleased. Changing public API is fine.
- The demo exists to verify integration, not to drive design. Never constrain or shape the API around how the demo uses it.
- Public API should be intuitive and hard to misuse. Prefer designs that make wrong usage a compile error over ones that fail at runtime.
- Avoid internal assumptions about the consumer's architecture, threading model or lifecycle.

## Code Changes

- Match the scope of changes to what was asked. A bug fix doesn't need surrounding cleanup.
- Don't speculate beyond the task — the API should be general (see Scope) but implementations should be minimal.
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

## Writing style

These rules apply to all text written into project files: comments, AGENTS.md entries, README edits, doc comment proposals.
- No Oxford comma.
- Prefer a new sentence over a semicolon or dash mid-sentence.

## Communication

- Keep responses concise.
- For exploratory questions, give a recommendation and the main tradeoff in 2–3 sentences. Don't implement until confirmed.
- Don't summarize what you just did at the end of a response.

## Swift & SPM

- Swift 6 / strict concurrency. All changes must compile without warnings.
- Prefer `actor`, `@MainActor` or `OSAllocatedUnfairLock` for concurrency. Avoid `@unchecked Sendable` unless internal synchronization is in place and documented on the type.
- Tests use Swift Testing (`@Test`, `@Suite`), not XCTest.

## Agent Setup

Each package has a local `AGENTS.md` that imports this file via `@path` and extends it with package-specific context. Use the `check-agents-md` skill to create or update it.

If files or context you expect to be auto-imported are missing, tell the user before proceeding.

Skills live in `snap/agents/skills/` — that is the source of truth. After editing a skill, run `snap/agents/sync-skills.sh` to propagate changes to all destinations.
