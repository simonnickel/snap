# Agent Setup

How the agent configuration reaches each session, and how to set it up on a machine.

## Layers

Each session loads the layers that apply to where it was started.

- **Global** — `snap/agents/AGENTS-global.md` and every convention file via `snap/docs/conventions/index.md`. Anything that applies regardless of project. Loaded in every project on the machine.
- **Workspace** — `snap/agents/AGENTS-workspace.md`. Loaded when a session starts in the workspace folder.
- **Suite** — `snap/agents/AGENTS-shared.md` and the docs it imports. What is specific to the SNAP suite. Imported by every package and by the workspace.
- **Package** — `<package>/AGENTS.md`. Loaded when a session starts in that package.
- **Skills** — `snap/agents/skills/`. Copied into the skill folders of Claude Code, Claude in Xcode, Codex CLI and Codex in Xcode.

## Expected setup

Machine:
- `~/.claude/CLAUDE.md` as a symlink to `snap/agents/AGENTS-global.md`
- Every skill copied into each skill folder

Workspace folder, containing `snap/` and all packages:
- `AGENTS.md` containing only `@snap/agents/AGENTS-workspace.md`

Each package, including `snap/`:
- `AGENTS.md` importing `@../snap/agents/AGENTS-shared.md` and adding package-specific context

## Applying it

```sh
$ snap/agents/setup.sh
```

Creates the symlink and the workspace `AGENTS.md`, and copies the skills. An existing file it would have to overwrite is reported instead.

`--check` reports what differs from the expected setup without changing anything.

Re-run it after adding, editing, renaming or removing a skill. Skills removed from `snap/agents/skills/` are removed from each skill folder, other skills in those folders are left untouched. Changes to `AGENTS*.md` and convention files need no re-run, they are imported directly.

## Skill names

Skill names are prefixed to indicate their scope:

- No prefix — operates on the current package
- `snap-` — operates across the whole suite
- `sn-` — generic, unrelated to the snap suite

## Package context

Each package `AGENTS.md` is created and maintained with the `check-agents-md` skill, including its import. The script does not touch or check package files.
