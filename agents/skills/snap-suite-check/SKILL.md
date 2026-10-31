---
name: snap-suite-check
description: Audit the suite documentation, skills and agent setup of the whole suite. Use for requests to check or audit the suite documentation, conventions, skills or agent setup.
argument-hint: [docs] [skills] [setup]
---

## Parts

- `docs` — every file in `snap/docs/`, `snap/agents/AGENTS-*.md` and `snap/README.md`
- `skills` — every skill in `snap/agents/skills/`
- `setup` — the output of `snap/agents/setup.sh --check` and the imports of every `AGENTS.md` in the workspace

Without an argument, every part is checked. With arguments, findings are limited to the named parts.

## Phase 1: Gather context

Gather every part in full, regardless of the arguments.

## Phase 2: Analyse

Check every part against:
- `snap/docs/documentation.md` for placement
- `snap/docs/conventions/writing-style.md` for wording and references
- `snap/docs/suite/skills.md` for skills
- `snap/docs/suite/agent-setup.md` for the setup

Check all parts together, following the "Across files" content checks in `AGENTS-global.md`.

Verify that:
- every referenced path, skill and symbol exists
- each skill's description matches its phases
- `snap/docs/conventions/index.md` imports every file in `snap/docs/conventions/`

## Phase 3: Present

Present findings.
