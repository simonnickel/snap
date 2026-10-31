# Skills

A skill describes a recurring multi-step workflow.

## Naming

Every skill in `snap/agents/skills/` is named `snap-<scope>-<name>`. The scope states what the skill operates on:

- `package` — the current SNAP package, using suite docs
- `suite` — the whole suite
- `generic` — any project, unrelated to the suite

`setup.sh` owns every `snap-*` folder in each skill folder.

## Content

A skill defines only the workflow: its steps, their order and where the user decides.

- Document anything that also applies outside the skill, and reference it by path.
	- Repeat it in the skill only where an explicit list makes the workflow clearer.
- A `generic` skill references only the global layer, since suite docs are not loaded outside the suite.


## Structure

- The frontmatter `name` matches the folder name.
- The frontmatter `description` states the skill's scope. A skill that combines other skills names them in it.
- `## Constraints`, if present, is the last section.
- A skill that works on part of a project takes the scope as an argument, covering the whole project without one.

## Phases

Each phase is a `## Phase <n>: <name>` section. Skills use this structure and diverge when a phase does something meaningfully different:

- **Gather context** — read files and collect inputs before analysis
- **Analyse** — evaluate the gathered context against defined criteria
- **Present findings** — present using the standard format defined in `AGENTS-global.md`

## Setup

- After changing a skill in `snap/agents/skills/`, run `snap/agents/setup.sh` to copy it into the skill folders of each agent tool.
