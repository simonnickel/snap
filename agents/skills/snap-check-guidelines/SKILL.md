---
name: snap-check-guidelines
description: Audit the shared AGENTS.md and all convention files for quality and correctness. Checks for internal consistency, gaps, redundancies and alignment between conventions and agent instructions.
---

Audit the shared AGENTS.md at `snap/agents/AGENTS.md` and all files in `snap/conventions/` as one logical unit.

**Goal:** agent instructions and conventions that are correct, clear, concise, internally consistent and free of gaps or redundancies.

## Phase 1: Gather context

Read in full:
- `snap/agents/AGENTS.md` and any files it imports
- All files in `snap/conventions/`
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

**Conflicts** — a rule in AGENTS.md that contradicts a convention, or two convention files that give conflicting guidance on the same topic

**Cross-file consistency** — terms defined in one convention file used differently in another or inconsistently in AGENTS.md

**Alignment** — conventions not reflected in agent instructions where they should be, and agent rules that imply an unstated convention worth making explicit

**Stale references** — paths, skills or tools that no longer exist

## Phase 3: Present findings

Present findings using the standard format defined in AGENTS.md.

When done, suggest running `/reflect` to capture any process improvements from the session.

## Constraints

- Do not change the intent or scope of a rule without explicit instruction.
- Changes to the shared AGENTS.md affect all packages in the suite — be conservative.
