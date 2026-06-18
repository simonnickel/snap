# Documentation

Where each kind of knowledge, decision or convention lives.

## Suite-wide, checked in

- **`snap/conventions/`** — Coding style, naming and structural rules.
- **`snap/agents/AGENTS-shared.md`** — Agent behavior and collaboration norms.
- **`snap/agents/skills/`** — Recurring multi-step workflows.
- **`snap/docs/`** — Suite-wide topics and cross-package constraints.

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
