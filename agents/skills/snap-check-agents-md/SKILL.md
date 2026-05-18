---
name: snap-check-agents-md
description: Audit the shared AGENTS.md for quality and correctness. Checks it against its own conventions, the check-agents-md quality criteria and cross-references within the snap suite.
---

Audit the shared AGENTS.md at `snap/agents/AGENTS.md` and any files it imports via `@path`.

**Goal:** a shared AGENTS.md that is correct, clear, concise and consistent with the conventions it defines.

## Phase 1: Gather context

Read in full:
- `snap/agents/AGENTS.md` and any files it imports
- The `check-agents-md` skill for quality criteria

## Phase 2: Analyse

Apply each category to the file and its imports. Complete the full analysis before presenting anything.

**Correctness**
- Claims about tools, paths or skills are accurate and those targets exist
- References to skills use correct names
- The writing style rules defined in the file are followed within the file itself

**Clarity**
- Each rule is unambiguous and actionable
- Instructions have enough context to apply correctly without over-specifying

**Brevity**
- No redundant content
- No rules that restate conventions an experienced Swift developer already knows

**Completeness**
- Suite-wide conventions are captured here rather than scattered in local AGENTS.md files
- No obvious gaps based on recurring agent mistakes

**Gaps** — missing rules or conventions that agents are likely to get wrong

**Redundancies** — content duplicated across the file or its imports

**Stale references** — paths, skills or tools that no longer exist

## Phase 3: Present findings

Show as a numbered list. For each item:
- **File** — which file is affected
- **Category** — one of the categories above
- **Finding** — description of the issue
- **Proposed change** — the exact edit to make

Do not apply any changes until the user has reviewed the list.

## Phase 4: Apply

Apply only the items the user accepts. After applying, run `snap/agents/sync-skills.sh` if any skill files were changed.

## Constraints

- Do not change the intent or scope of a rule without explicit instruction.
- Changes to the shared AGENTS.md affect all packages in the suite — be conservative.

When done, suggest running `/reflect` to capture any process improvements from the session.
