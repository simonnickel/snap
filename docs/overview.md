# Documentation Overview

A map of where each kind of knowledge, decision or convention lives. Use it to decide where to write or find something, depending on its kind and scope.

## Global, checked in

Imported into every project on this machine, via the `~/.claude/CLAUDE.md` symlink to `AGENTS-global.md`.

- **`snap/agents/AGENTS-global.md`** — Agent behavior and collaboration norms that apply to any project.
- **`snap/agents/skills/`** — Recurring multi-step workflows, synced to the agent tools.
- **`snap/docs/`** — Knowledge that applies to any project.
  - **`snap/docs/index.md`** — Imports every file in the folder.
  - **`snap/docs/conventions/`** — Design principles, code style and naming conventions.

## Suite-wide, checked in

- **`snap/README.md`** — Suite overview, install, headline highlights.
- **`snap/agents/AGENTS-shared.md`** — Agent behavior and collaboration norms specific to the snap suite.

## Module, checked in

- **`<module>/AGENTS.md`** — Agent behavior and collaboration norms specific to the module.
- **`<module>/README.md`** — Consumer overview, install, headline features.
- **`<module>/docs/`** — Module architecture, conventions, long-form guides, migration notes, internal design.
- **Doc comments on public symbols** — How to use the API.

## Per-machine, not synced

- **`~/.claude/projects/<project>/memory/`** — Only for things tied to one machine, or as temporary notes before a finding settles into a checked-in location.

## Ephemeral

- **Commit messages and PR descriptions** — Why this change.
- **`// TODO:` in source** — Outstanding work.
