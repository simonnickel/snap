# Skills

A skill describes a recurring multi-step workflow.

## Naming

Every skill in `snap/agents/skills/` is named `snap-<scope>-<name>`. The scope states what the skill operates on:

- `package` — the current SNAP package, using suite docs
- `suite` — the whole suite
- `generic` — any project, unrelated to the suite

## Content

A skill defines only the workflow: its steps, their order and where the user decides.

- Document anything that also applies outside the skill, and reference it by path.
	- Repeat it in the skill only where an explicit list makes the workflow clearer.
- A skill states what to present and where to ask the user, not how. The global rules define how.
- A `generic` skill references only the global layer, since suite docs are not loaded outside the suite.


## Structure

- The frontmatter `name` matches the folder name.
- The frontmatter `description` states the skill's scope.
- The frontmatter `description` states which requests trigger the skill, in a sentence starting with "Use for requests to".
- A skill that takes arguments names them in the frontmatter `argument-hint`.
- `## Constraints`, if present, is the last section.
- A skill that works on part of a project takes the scope as an argument, covering the whole project without one.

## Phases

Each phase is a `## Phase <n>: <name>` section. Skills use this structure and diverge when a phase does something meaningfully different:

- **Gather context** — read files and collect inputs before analysis
- **Analyse** — evaluate the gathered context against defined criteria
- **Present** — present the result and ask how to proceed

## Setup

- After changing a skill in `snap/agents/skills/`, run `snap/agents/setup.sh`, as described in `snap/docs/suite/agent-setup.md`.
