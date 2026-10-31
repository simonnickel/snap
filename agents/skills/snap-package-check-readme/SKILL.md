---
name: snap-package-check-readme
description: Maintain the README of the current package. Analyses the package and suggests additions, updates and removals.
---

## Phase 1: Gather context

- Read the README and the `AGENTS.md`. A missing README counts as empty.
- Read the package in full: manifest, public API with its doc comments, tests, demo and `docs/`.

## Phase 2: Analyse the package

Collect what the package would need in its README, following the README entry in `snap/docs/documentation.md`. Work from the package, not from the existing file.

## Phase 3: Compare

Compare the collected content with the README, following the content checks in `AGENTS-global.md`.

## Phase 4: Present findings

Present findings.
