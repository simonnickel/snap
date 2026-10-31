---
name: snap-package-check-agents-md
description: Maintain the AGENTS.md of the current package. Analyses the package and suggests additions, updates and removals.
---

## Phase 1: Gather context

- Read the `AGENTS.md` and everything it imports. A missing file counts as empty.
- Read the package in full: manifest, sources, tests, README and `docs/`.

## Phase 2: Analyse the package

Collect what the package would need in its `AGENTS.md`, following the `AGENTS.md` entry in `snap/docs/documentation.md`. Work from the package, not from the existing file.

## Phase 3: Compare

Compare the collected content with the `AGENTS.md`, following the content checks in `AGENTS-global.md`.

## Phase 4: Present findings

Present findings.
