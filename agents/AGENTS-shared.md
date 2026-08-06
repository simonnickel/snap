# The SNAP Suite

SNAP (SN App Packages) is a set of Swift libraries for building iOS apps. `snap/` is the coordinating repository; the packages live alongside it as individual git repositories.

## Packages

| Package | Purpose | Depends on |
|---|---|---|
| `snap-foundation` | Extensions for Swift, Foundation and OSLog | — |
| `snap-core` | SwiftUI/UIKit extensions, helpers and workarounds | snap-foundation |
| `snap-style` | Semantic styling system (colors, fonts, spacing) for SwiftUI | snap-foundation, snap-core |
| `snap-settings-service` | Settings storage: Codable values in UserDefaults, iCloud KV or custom store | snap-core |
| `snap-navigation` | SwiftUI navigation structure decoupled from presentation | snap-foundation |
| `snap-dependencies` | Dependency injection container | snap-foundation |
| `snap-swift-data` | SwiftData/CoreData interoperability and Persistent History Tracking | — |
| `snap-template` | Shared app code and demo project | snap-core, snap-style, snap-settings-service, snap-navigation, snap-dependencies |

Dependencies run one way, toward `snap-foundation`.

- Feature packages never depend on each other. Shared code moves down into `snap-core` or `snap-foundation`.
- `snap-template` is the only package that combines features.
- `snap-swift-data` has no dependency in the suite. An app consumes it directly.

## Documentation

Any documentation about the suite lives in `snap/docs/`.

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

## Changes

- Match the scope of changes to what was asked. A bug fix doesn't need surrounding cleanup.
- Don't speculate beyond the task. The API should be general but implementations should be minimal.
- Don't add error handling or fallbacks beyond what the task requires.
- Default to writing no comments. See `conventions/code-comments.md` for when and how.
- When adding to AGENTS.md, convention or docs files, check all existing sections for duplicate intent first.

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
- **Present findings** — present using the standard format defined in AGENTS.md
