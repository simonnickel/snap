---
name: snap-suite-check
description: Audit the suite documentation, skills, agent setup and remaining repository files of the whole suite, and compare every package against the package template. Use for requests to check or audit the suite documentation, conventions, skills, agent setup, repository files or the match of packages with the template.
argument-hint: [docs] [skills] [setup] [template] [other]
---

## Parts

- `docs` — every file in `snap/docs/`, `snap/agents/AGENTS-*.md` and `snap/README.md`
- `skills` — every skill in `snap/agents/skills/`
- `setup` — the output of `snap/agents/setup.sh --check` and the imports of every `AGENTS.md` in the workspace
- `template` — `snap/package-template/` with its hidden files, `snap/docs/suite/package-template.md` and the files of every package that correspond to them
- `other` — every file in `snap/` that no other part covers

Without an argument, every part is checked. With arguments, findings are limited to the named parts.

## Phase 1: Gather context

Gather every part in full, regardless of the arguments.

## Phase 2: Analyse

Check every part against:
- `snap/docs/documentation.md` for placement
- `snap/docs/conventions/writing-style.md` for wording and references
- `snap/docs/suite/skills.md` for skills
- `snap/docs/suite/agent-setup.md` for the setup

Compare every package against the template:
- Files of the template that the package lacks
- Settings that differ, such as the tools version, `.spi.yml` targets or the file header
- The README structure: badges and sections, not their content
- Values that are specific to the package are ignored, such as names, platforms and dependencies.

Check all parts together, following the "Across files" content checks in `AGENTS-global.md`.

Verify that:
- every referenced path, skill and symbol exists
- each skill's description matches its phases
- `snap/docs/conventions/index.md` imports every file in `snap/docs/conventions/`
- `snap/packages.json` lists every package in `snap/docs/suite/packages-overview.md`

## Phase 3: Present

Present findings. State for each difference from the template whether the package or the template should change.
