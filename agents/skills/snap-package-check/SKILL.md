---
name: snap-package-check
description: Maintain the README and AGENTS.md of the current package and compare the package against the package template. Suggests additions, updates and removals. Use for requests to check or review a package, its README, AGENTS.md or match with the template.
argument-hint: [readme] [agents-md] [template]
---

## Parts

- `readme` — the README
- `agents-md` — the `AGENTS.md` and everything it imports
- `template` — the package compared against `snap/package-template/`

Without an argument, every part is checked. With arguments, findings are limited to the named parts.

## Phase 1: Gather context

Gather every part in full, regardless of the arguments.

- Read the package in full: manifest, sources with their doc comments, tests, demo, README, `AGENTS.md` with everything it imports and `docs/`. A missing README or `AGENTS.md` counts as empty.
- Read `snap/package-template/` in full, including hidden files, and `snap/docs/suite/package-template.md`.

## Phase 2: Analyse

Work from the package, not from the existing files.

- `readme`: collect what the package needs in its README, following the README entry in `snap/docs/documentation.md`.
- `agents-md`: collect what the package needs in its `AGENTS.md`, following the `AGENTS.md` entry in `snap/docs/documentation.md`.
- `template`: compare the package against the template:
  - Files of the template that the package lacks
  - Settings that differ, such as the tools version, `.spi.yml` targets or the file header
  - The README structure: badges and sections, not their content
  - Values that are specific to the package are ignored, such as names, platforms and dependencies.

Compare the collected content with the README and `AGENTS.md`, following the content checks in `AGENTS-global.md`, including "Across files".

## Phase 3: Present findings

Present findings. State for each difference from the template whether the package or the template should change.
