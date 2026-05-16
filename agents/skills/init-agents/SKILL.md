---
name: init-agents
description: Create or update a local AGENTS.md for the current package. Imports a shared AGENTS.md and extends it with package-specific architecture and context. Use when setting up a new package or when the local AGENTS.md needs refreshing.
---

Create or update the local `AGENTS.md` for this package.

Goal: a file that gives an AI agent a complete, non-redundant picture of this specific package — as short as possible while covering everything non-obvious.

## Process

1. **Find the shared AGENTS.md** — look for a shared agents file in parent directories (e.g. `../snap/agents/AGENTS.md` or similar). Read it and any files it imports (`@path` references) to understand what is already covered.
2. **Read the existing local AGENTS.md** if present. Note its `@import` line if any. If the file has real content beyond the `@import` line, treat it as the baseline — note what's already there so you don't propose removing valid content or re-adding what's already covered.
3. **Analyse the codebase:**
   - `Package.swift` — targets, products, dependencies, platforms, Swift version
   - `Sources/` directory structure — how targets are organised, layering, naming patterns
   - Key source files to understand: main types, protocols, patterns, relationships between types
   - Any `README.md` for high-level intent
4. **Propose** the changes. Do not write the file until confirmed. If creating from scratch, show the full content. If updating an existing file, show only the changes (additions, removals, edits) with a brief reason for each.
5. **Apply** after confirmation.

## Structure of the local AGENTS.md

```
@path/to/shared/AGENTS.md

# <PackageName>

One or two sentences: what this package does and its core mechanism.

## <Section>
...
```

The `@import` line must be the first line. Sections follow only for topics not covered by the shared file.

## What to include

Include only information that:
- Is specific to this package (not generic Swift/SPM/SwiftUI knowledge)
- Is non-obvious and requires reading multiple files to understand
- An agent would make a concrete mistake without it — not just "saves re-reading", but actively leads to wrong decisions

Typical useful sections:
- **Target structure** — if there are multiple targets with a non-obvious layering or dependency order
- **Core types** — the key types, what they own, how they relate; skip types whose purpose is obvious from their name
- **Key patterns** — recurring design patterns specific to this codebase (e.g. value resolution strategy, modifier chains)
- **Testing** — only if there are non-standard helpers or conventions beyond what the shared file covers

## What to exclude

- Anything already covered by the shared AGENTS.md or its imports
- Standard SPM commands (`swift build`, `swift test`) — obvious to any Swift developer
- Generic SwiftUI or Swift patterns not specific to this package
- File listings or directory trees that can be trivially discovered
- Obvious instructions ("write tests", "handle errors")
- Trailing sentences that restate the obvious ("follow this pattern for new X")
- SPM dependencies and platform versions (derivable from Package.swift)
- For grab-bag utility packages with no shared architecture, skip individual type docs entirely — only flag things that look wrong but are intentional (e.g. bug workarounds)

## Constraints

- Propose before writing. Show the full proposed content as a code block.
- If something belongs in the shared AGENTS.md rather than the local one, propose extending the shared file instead.
- Keep it tight — one clear sentence beats a clear paragraph.
