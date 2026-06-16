---
name: check-agents-md
description: Create, update or improve the local AGENTS.md for the current package. Use when setting up a new package, after significant code changes, or when new process knowledge should be captured. Imports `AGENTS-shared.md` and extends it with package-specific context.
---

**Goal:** a file that gives an AI agent a complete, non-redundant picture of this specific package. Keep it concise and focused. Include only content where an agent would make a concrete mistake without it, not just "saves re-reading."

## Phase 1: Gather context

- Locate `AGENTS-shared.md`. It should already be in context via the local file's import. If it isn't, tell the user before continuing. `AGENTS-shared.md` is used as a deduplication reference only. It is not audited as part of this check. To audit it, run this skill from its home package.
- Read the existing local AGENTS.md if present. Note its `@import` line if any. If the file has real content beyond the `@import` line, treat it as the baseline. Note what's already there so you don't propose removing valid content or re-adding what's already covered.
- Check that `CLAUDE.md` and `AGENTS.md` match the setup described in the Agent Setup section of `AGENTS-shared.md`. If either is missing or incorrect, include creating or fixing it in the proposal.
- Run `/context` to verify the agent setup is loaded correctly. If files you expect to be auto-imported are missing, tell the user before proceeding.

## Phase 2: Analyse

- `Package.swift` — targets, products, dependencies, platforms, Swift version
- `Sources/` directory structure — how targets are organised, layering, naming patterns
- Key source files to understand: main types, protocols, patterns, relationships between types
- Any `README.md` for high-level intent

## Phase 3: Present proposal

Do not write the file until confirmed. If creating from scratch, show the full content. If updating an existing file, show only the changes (additions, removals, edits) with a brief reason for each. Suggest going through them one by one.

### Structure

```
@path/to/AGENTS-shared.md

# <PackageName>

One or two sentences: what this package does and its core mechanism.

## <Section>
...
```

The `@import` line must be the first line.

Typical sections to consider:
- **Target structure** — if there are multiple targets with a non-obvious layering or dependency order
- **Key types** — only types whose role requires reading multiple files to understand, or where two related types are easily confused
- **Key patterns** — recurring design patterns specific to this codebase (e.g. value resolution strategy, modifier chains)
- **Testing** — only if there are non-standard helpers or conventions beyond what the shared file covers

### What to exclude

- Anything already covered by `AGENTS-shared.md` or its imports
- Anything discoverable by inspection: content in a single source file, file listings, directory trees, doc comments
  - Exception: a one-liner distinguishing two easily-confused related types (e.g. a static descriptor vs its live runtime counterpart)
- Generic Swift, SwiftUI or SPM knowledge (e.g. commands, patterns, dependencies, platform versions)
- Obvious instructions ("write tests", "handle errors") or trailing sentences that restate the obvious ("follow this pattern for new X")
- For packages of independent utilities with no shared architecture, skip individual type docs entirely. If something looks wrong but is intentional, document it in the source comment. Only add it here if the source comment alone isn't enough, e.g. the pattern spans multiple files and a reader of any single one wouldn't understand the constraint.
- **This file is for agents working on the package internals, not its consumers.** If a detail only matters to someone integrating the package, put it in doc comments instead.

When done, suggest running `/reflect` to capture any process improvements from the session.

## Constraints

- If something belongs in `AGENTS-shared.md` rather than the local one, propose extending the shared file instead.
- Keep entries concise and focused.
- When process knowledge is captured that should improve these guidelines, update this skill's source file and run the sync script.
