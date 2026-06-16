@../conventions/index.md

# The SNAP Suite

SNAP (SN App Packages) is a set of Swift libraries for building iOS apps. `snap/` is the coordinating repository; the packages live alongside it as individual git repositories.

## Packages

| Package | Purpose | Depends on |
|---|---|---|
| `snap-foundation` | Extensions for Swift, Foundation and OSLog | — |
| `snap-core` | SwiftUI/UIKit extensions, helpers and workarounds | snap-foundation |
| `snap-style` | Semantic styling system (colors, fonts, spacing) for SwiftUI | snap-core |
| `snap-settings-service` | Settings storage: Codable values in UserDefaults, iCloud KV or custom store | snap-core |
| `snap-navigation` | SwiftUI navigation structure decoupled from presentation | snap-foundation |
| `snap-dependencies` | Dependency injection container | snap-foundation |
| `snap-swift-data` | SwiftData/CoreData interoperability and Persistent History Tracking | — |
| `snap-template` | Shared app code and demo project | snap-style, snap-settings-service, snap-navigation, snap-dependencies |

# Agent Instructions

## Collaboration

- You are working with an experienced developer. Skip explanations of common patterns and concepts. Be direct.
- Ask before changing code. Propose first, implement after confirmation.
- Use Xcode MCP when relevant (building, running tests, checking errors).
- When a tool fails because of a one-time environment fix (e.g. `xcode-select` points to CLT, missing simulator platform), surface it instead of silently working around it.

## Scope

These are Swift library packages intended for arbitrary consumption (any app or package, unknown at the time of writing). Design decisions must hold up across a wide range of usage contexts.

- Unreleased. Changing public API is fine.
- The demo exists to verify integration, not to drive design. Never constrain or shape the API around how the demo uses it.
- Public API should be intuitive and hard to misuse. Prefer designs that make wrong usage a compile error over ones that fail at runtime.
- Avoid internal assumptions about the consumer's architecture, threading model or lifecycle.
- Prefer designing for how an API could be used over how it currently is used.

## Changes

- Match the scope of changes to what was asked. A bug fix doesn't need surrounding cleanup.
- Don't speculate beyond the task. The API should be general (see Scope) but implementations should be minimal.
- Don't add error handling or fallbacks beyond what the task requires.
- Default to writing no comments. See the Comments section for when and how.
- When adding to AGENTS.md or convention files, check all existing sections for duplicate intent first.

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
- For exploratory questions, give a recommendation and the main tradeoff in 2–3 sentences.
- Don't summarize what you just did at the end of a response.
- When proposing any change, always include the file path, line number and a diff.
- When surfacing multiple findings:
  - Show a numbered list.
  - Group and prioritize.
  - Suggest going through them one by one.

## Swift & SPM

- Swift 6 / strict concurrency. All changes must compile without warnings.
- Prefer `actor`, `@MainActor` or `OSAllocatedUnfairLock` for concurrency. Avoid `@unchecked Sendable` unless internal synchronization is in place and documented on the type.
- Tests use Swift Testing (`@Test`, `@Suite`), not XCTest.

## Agent Setup

Each package needs these files. Use the `check-agents-md` skill to create or update them:
- `CLAUDE.md` in the root containing only `@AGENTS.md` (what Claude Code auto-imports)
- `AGENTS.md` importing this file and extending it with package-specific context

The packages share a workspace folder where each lives as an individual git repository alongside `snap/`. The workspace folder follows the same pattern, with its `AGENTS.md` importing `@snap/AGENTS.md` → `@agents/AGENTS-shared.md` (this file).

Skills live in `snap/agents/skills/`. After editing a skill, run `snap/agents/sync-skills.sh` to propagate changes to all destinations. When renaming a skill, manually remove the old folder from each destination (the sync script copies but does not clean up stale entries). `AGENTS.md` and convention files do not need syncing — they are imported directly by each package.

## Skill Conventions

Skills typically use this phase structure. Diverge when a phase does something meaningfully different:
- **Gather context** — read files and collect inputs before analysis
- **Analyse** — evaluate the gathered context against defined criteria
- **Present findings** — present using the Communication conventions above
