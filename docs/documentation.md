# Documentation Overview

A map of where each kind of knowledge, decision or convention lives. Use it to decide where to write or find something, depending on its kind and scope.

- Split a section that mixes content of different scopes.
- Keep one topic per file.
- Before adding to any of these files, check all of them, following the "Across files" content checks in `AGENTS-global.md`.
- Prefer updating an existing entry over adding a new one.
- Delete an entry that is redundant or no longer holds.

## Global

Loaded in every project on this machine, as described in `snap/docs/suite/agent-setup.md`.

- **`snap/agents/AGENTS-global.md`** — Agent behavior and collaboration norms that apply to any project.
- **`snap/docs/conventions/`** — Conventions that apply to any project.
  - **`snap/docs/conventions/index.md`** — Imports every convention file. A new file only loads once listed here.
- **`snap/agents/skills/`** — Recurring multi-step workflows.

## Suite

Loaded in every SNAP package and the workspace, as described in `snap/docs/suite/agent-setup.md`.

- **`snap/agents/AGENTS-shared.md`** — What is specific to the SNAP suite.
- **`snap/agents/AGENTS-workspace.md`** — Additions for sessions started in the workspace folder.
- **`snap/docs/suite/`** — Documentation about the suite as a whole.
- **`snap/docs/todo/`** — Outstanding work on the suite.

## Repository

Paths are relative to the repository root.

- **`AGENTS.md`** — Agent orientation for working on the repository itself: what it does, how it is structured and what is easy to get wrong.
  - Contains only what an agent would get wrong without it.
  - Covers what spans several files: structure, layering, recurring patterns and invariants.
  - Covers related types that are easily confused.
  - Covers what looks wrong but is intentional, when a source comment alone does not explain it.
  - Excludes content already loaded through imports.
  - Excludes what one source file, a file listing or a doc comment already shows.
  - Excludes general language, framework and tooling knowledge.
  - Excludes details that only matter to consumers. These belong in doc comments.
- **`README.md`** — Consumer overview: features, requirements and install.
  - Covers each feature with the smallest example needed to use it. A package of independent utilities summarizes its features by group.
  - Covers limitations that would surprise a new user.
  - Covers the design choices that explain why a feature behaves as it does.
  - States platforms, language version and dependencies in the text, not only in badges.
  - Links to each guide in `docs/` intended for consumers.
  - Excludes API reference detail. It belongs in doc comments.
  - Excludes filler, marketing voice and emojis.
- **`docs/`** — Any documentation about the repository.
- **Doc comments on public symbols** — How to use the API.

### Common files in `docs/`

Add one when there is content for it, not upfront.

- **`mission-statement.md`** — Why the project exists and what it optimizes for.
- **`architecture.md`** — How the project is structured and why.
- **`decisions.md`** — A decision, the alternatives considered and the reason for the choice.
- **`todo/`** — Outstanding work that is not tied to one place in the code.
  - **`todos.md`** — The list of items.
    - Each item has a fixed id (`TODO-1`) that is never reassigned.
    - Items are ordered by execution, not by id.
    - Resolved items are removed and their id is retired.
  - **`todo-<id>.md`** — The details of an item that outgrows a few bullets. Its entry stays in `todos.md` and links to the file.
  - **`plan-<description>.md`** — A plan that is not decided yet. It becomes an item in `todos.md` once decided.
- **`<topic>.md`** — A guide for a single topic, e.g. usage, setup or migration.

## Per-machine

- **`~/.claude/projects/<project>/memory/`** — Only for things tied to one machine, or as temporary notes before a finding settles into a checked-in location.

## Ephemeral

- **Commit messages and PR descriptions** — Why this change.
- **`// TODO:` in source** — Outstanding work in one place in the code.
