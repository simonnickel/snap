# Agent Setup

How the agent configuration reaches each session, and how to set it up on a machine.

Only Claude Code is fully supported. Other tools get the skills, but the setup does not ensure that they load the global layer or resolve `@` imports.

## Layers

Each session loads the layers that apply to where it was started, through the files in "Expected setup".

- **Global** — `snap/agents/AGENTS-global.md`, `snap/docs/documentation.md` and every convention file via `snap/docs/conventions/index.md`.
- **Suite** — `snap/agents/AGENTS-shared.md` and the docs it imports.
- **Package** — `<package>/AGENTS.md`.
- **Skills** — `snap/agents/skills/`, copied into the skill folders and available in every project.

## Expected setup

Machine:
- `~/.claude/CLAUDE.md` as a symlink to `snap/agents/AGENTS-global.md`
- Every skill copied into each skill folder

Workspace folder, containing `snap/` and all packages:
- `AGENTS.md` containing only `@snap/agents/AGENTS-shared.md`

Each package, including `snap/`:
- `AGENTS.md` importing `@../snap/agents/AGENTS-shared.md` and adding package-specific context

## Applying it

```sh
$ snap/agents/setup.sh
```

Creates the symlink and the workspace `AGENTS.md`, and copies the skills. An existing file it would have to overwrite is reported instead.

`--check` reports what differs from the expected setup without changing anything.

Re-run it after adding, editing, renaming or removing a skill. Every `snap-*` folder in each skill folder is replaced with the current skills. Other skills in those folders are left untouched. Changes to `AGENTS*.md` and convention files need no re-run, since they are imported directly.

## Package context

The content of each package `AGENTS.md` is maintained with the `agents-md` part of the `snap-package-check` skill. Its import is checked by `snap-suite-check`. The script does not touch or check package files.
