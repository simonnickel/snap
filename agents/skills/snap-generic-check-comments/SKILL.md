---
name: snap-generic-check-comments
description: Maintain the source comments of the current project or a given part of it. Analyzes the code and suggests additions, updates and removals. Use for requests to check, review or update source comments.
argument-hint: [scope]
---

## Scope

The arguments name the part of the project to cover. Without an argument, the whole project is covered.

Findings are limited to the scope. Code outside it is read only where needed to understand the code in scope.

## Phase 1: Gather context

- Read every source file in scope with its comments.
- Skip file header boilerplate and `TODO` comments. Check `// MARK:` only for wording.

## Phase 2: Analyze the code

Collect where the code needs a comment, following `snap/docs/conventions/code-comments.md`. Work from the code, not from the existing comments.

## Phase 3: Compare

Compare the collected comments with the existing ones, following the content checks in `AGENTS-global.md`.

## Phase 4: Present

Present findings.
