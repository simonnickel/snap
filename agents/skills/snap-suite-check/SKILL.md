---
name: snap-suite-check
description: Audit the suite documentation, skills and agent setup of the whole suite.
argument-hint: [docs] [skills] [setup]
---

## Parts

- `docs` — every file in `snap/docs/` and `snap/agents/AGENTS-*.md`
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

Verify that every referenced path, skill and symbol exists.

## Phase 3: Present findings

Present findings.
