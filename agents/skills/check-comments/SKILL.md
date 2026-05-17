---
name: check-comments
description: Check all source comments in the package for typos, correctness, clarity, brevity and policy compliance. Fixes typos immediately; lists content changes for per-item decision.
---

Audit every source comment in the package and fix issues.

Goal: source comments that are correct, clear, brief and compliant with the project's comment policy.

**Typos and spelling:** fix all immediately without asking, then report the changes made.
**All other issues:** collect every finding first, then present as a numbered list. The user decides per item before any edit is applied.

## Phase 1: Scan all source files

Collect every comment from `Sources/`:
- Doc comments (`///`) on any declaration
- Inline comments (`//`) in function bodies
- `// MARK:` and other structural markers — check for typos only, not content

Skip:
- File header boilerplate (the standard project/author block at the top of each file)
- `TODO` and `FIXME` markers

## Phase 2: Fix typos immediately

Fix all spelling errors across all files without asking. Report each change as: file path, line, old → new.

## Phase 3: Collect content issues

Check every comment against each category:

**Correctness**
- Parameter names or labels in a doc comment don't match the actual signature
- Return description doesn't match the actual return type or behaviour
- Vague or unsupported claims ("for some reason", "somehow", "always") — propose a precise replacement or flag for removal

**Clarity**
- Phrasing that has two reasonable readings

**Brevity**
- Comment restates what the declaration name already conveys
- Explanation longer than necessary for the idea it carries

**Policy compliance**
- Flag violations of the project's comment policy

**Missing doc comments**
- Public declarations with no doc comment whose purpose is not obvious from the name alone — draft the proposed doc comment text as the proposal

## Phase 4: Present and apply

Show all issues as a numbered list. For each item include: file path + line, the current comment (or "missing" for absent doc comments), the category, and the proposed change.

Wait for the user to decide which items to accept. Apply only the accepted ones.

When done, suggest running `/reflect` to capture any process improvements from the session.

## Constraints

- Complete Phase 3 in full before presenting anything.
- Apply only the content changes the user accepts.
- Do not modify source code for any reason other than comments.
