---
name: agents-md
description: Create, update, or improve the local AGENTS.md for the current package. Use when setting up a new package, after significant code changes, or when new process knowledge should be captured. Imports a shared AGENTS.md and extends it with package-specific context.
---

Goal: a file that gives an AI agent a complete, non-redundant picture of this specific package — as short as possible. Include only content where an agent would make a concrete mistake without it, not just "saves re-reading."

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

The `@import` line must be the first line.

Typical sections to consider:
- **Target structure** — if there are multiple targets with a non-obvious layering or dependency order
- **Key types** — only types whose role requires reading multiple files to understand, or where two related types are easily confused
- **Key patterns** — recurring design patterns specific to this codebase (e.g. value resolution strategy, modifier chains)
- **Testing** — only if there are non-standard helpers or conventions beyond what the shared file covers

## What to exclude

- Anything already covered by the shared AGENTS.md or its imports
- Anything discoverable by inspection: content in a single source file, file listings, directory trees, doc comments
  - Exception: a one-liner distinguishing two easily-confused related types (e.g. a static descriptor vs its live runtime counterpart)
- Generic Swift, SwiftUI or SPM knowledge — commands, patterns, dependencies, platform versions
- Obvious instructions ("write tests", "handle errors") or trailing sentences that restate the obvious ("follow this pattern for new X")
- For packages of independent utilities with no shared architecture, skip individual type docs entirely. If something looks wrong but is intentional, document it in the source comment. Only add it here if the source comment alone isn't enough — e.g. the pattern spans multiple files and a reader of any single one wouldn't understand the constraint.
- Non-obvious details that would benefit a *consumer* of the package belong in source doc comments, not here — AGENTS.md is for agents working within this repo

## Constraints

- If something belongs in the shared AGENTS.md rather than the local one, propose extending the shared file instead.
- Keep it tight — one clear sentence beats a clear paragraph.
- When process knowledge is captured that should improve these guidelines, update this skill's source file and run the sync script.
