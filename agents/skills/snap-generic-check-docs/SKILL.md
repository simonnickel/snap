---
name: snap-generic-check-docs
description: Maintain the README, AGENTS.md and docs/ folder of the current project. Suggests additions, updates and removals. Use for requests to check or review the docs of a project, its README, AGENTS.md or docs/ folder.
argument-hint: [readme] [agents-md] [docs]
---

## Parts

- `readme` — the README
- `agents-md` — the `AGENTS.md` and everything it imports
- `docs` — every file in `docs/`

Without an argument, every part is checked. With arguments, findings are limited to the named parts.

## Phase 1: Gather context

Gather every part in full, regardless of the arguments.

- Read the project in full: manifest, sources with their doc comments, tests, demo, README, `AGENTS.md` with everything it imports and `docs/`. A missing README or `AGENTS.md` counts as empty.

## Phase 2: Analyze

Work from the project, not from the existing files.

- `readme`: collect what the project needs in its README, following the README entry in `snap/docs/documentation.md`.
- `agents-md`: collect what the project needs in its `AGENTS.md`, following the `AGENTS.md` entry in `snap/docs/documentation.md`.
- `docs`: check each file in `docs/` against the `docs/` entries in `snap/docs/documentation.md`, including the rules for the TODO list and plans.

Compare the collected content with the README, `AGENTS.md` and `docs/`, following the content checks in `AGENTS-global.md`, including "Across files".

## Phase 3: Present

Present findings.
