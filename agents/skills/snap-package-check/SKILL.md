---
name: snap-package-check
description: Maintain the README and AGENTS.md of the current package. Suggests additions, updates and removals. Use for requests to check or review a package, its README or AGENTS.md.
argument-hint: [readme] [agents-md]
---

## Parts

- `readme` — the README
- `agents-md` — the `AGENTS.md` and everything it imports

Without an argument, every part is checked. With arguments, findings are limited to the named parts.

## Phase 1: Gather context

Gather every part in full, regardless of the arguments.

- Read the package in full: manifest, sources with their doc comments, tests, demo, README, `AGENTS.md` with everything it imports and `docs/`. A missing README or `AGENTS.md` counts as empty.

## Phase 2: Analyse

Work from the package, not from the existing files.

- `readme`: collect what the package needs in its README, following the README entry in `snap/docs/documentation.md`.
- `agents-md`: collect what the package needs in its `AGENTS.md`, following the `AGENTS.md` entry in `snap/docs/documentation.md`.

Compare the collected content with the README and `AGENTS.md`, following the content checks in `AGENTS-global.md`, including "Across files".

## Phase 3: Present

Present findings.
