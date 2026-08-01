# Documentation Overview

A map of where each kind of knowledge, decision or convention lives. Use it to decide where to write or find something, depending on its kind and scope.

## Suite-wide, checked in

- **`snap/README.md`** — Suite overview, install, headline highlights.
- **`snap/agents/AGENTS-global.md`** — Agent behavior and collaboration norms that apply to any project, not just this suite.
- **`snap/agents/AGENTS-shared.md`** — Agent behavior and collaboration norms specific to the snap suite.
- **`snap/agents/skills/`** — Recurring multi-step workflows.
- **`snap/docs/`** — Suite-wide knowledge, e.g. architecture decisions and cross-package constraints.
  - **`snap/docs/conventions/`** — Design principles, code style and naming conventions applied across all packages.

## Package, checked in

- **`snap-<pkg>/AGENTS.md`** — Package architecture and package-only conventions.
- **`snap-<pkg>/README.md`** — Consumer overview, install, headline features.
- **`snap-<pkg>/docs/`** — Long-form guides, migration notes, internal design.
- **Doc comments on public symbols** — How to use the API.

## Per-machine, not synced

- **`~/.claude/projects/<project>/memory/`** — Only for things tied to one machine, or as temporary notes before a finding settles into a checked-in location.

## Ephemeral

- **Commit messages and PR descriptions** — Why this change.
- **`// TODO:` in source** — Outstanding work.
