---
name: snap-package-compare-against-template
description: Compare the current package with the package template. Suggests changes to the package or the template.
---

## Phase 1: Gather context

- Read `snap/package-template/` in full, including hidden files, and `snap/docs/suite/package-template.md`.
- Read the files of the package that correspond to them.

## Phase 2: Analyse

Compare the package with the template:

- Files of the template that the package lacks
- Settings that differ, such as the tools version, `.spi.yml` targets or the file header
- The README structure: badges and sections, not their content

Ignore values that are specific to the package, such as names, platforms and dependencies.

## Phase 3: Present findings

Present findings. State for each difference whether the package or the template should change.
