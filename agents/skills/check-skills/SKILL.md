---
name: check-skills
description: Audit all skill files for quality and consistency. Checks each skill against project conventions and checks across all skills for gaps, redundancies, conflicts, ambiguities, scope issues, stale references and naming discrepancies.
---

Audit all skill files individually and as a set.

**Goal:** skill files that are individually correct, clear and convention-compliant, and collectively consistent, non-redundant and gap-free.

## Phase 1: Gather context

Read in full:
- All skill files in `snap/agents/skills/`. If that path is not present, use `~/.claude/skills/`.
- `AGENTS.md` (shared and local) for conventions

## Phase 2: Analyse

Apply each category both within individual skills and across all skills as a set. Complete the full analysis before presenting anything.

**Correctness**
- Claims about what other skills do are accurate
- AGENTS.md conventions are followed
- References to other skills use correct names (e.g. `/check-comments`)

**Clarity**
- Goal is stated clearly
- Instructions are unambiguous and actionable
- Phases or steps are in a logical order

**Brevity**
- No redundant content
- No instructions that restate the obvious

**Completeness**
- The skill's scope and goal are explicit
- Constraints section covers the non-obvious limits of the skill's scope

**Gaps** — tasks or scenarios not covered, including missing cross-references between skills that overlap in scope

**Redundancies** — content duplicated that could live in one place

**Conflicts** — instructions that contradict each other

**Ambiguities** — instructions with more than one reasonable reading

**Scope issues** — a skill doing too much, or doing things that belong to another skill

**Stale references** — references to skills, paths or files that don't exist or have been renamed. Verify a path or skill actually exists before flagging it.

**Naming discrepancies** — the same concept referred to by different terms, or inconsistent section names, phase structures or tone

## Phase 3: Present findings

Collect all findings before presenting anything. Show as a numbered list, grouped by skill for individual findings and as a separate group for cross-skill findings. For each item:
- **Skill** — the skill file(s) affected
- **Category** — one of the categories above
- **Finding** — description of the issue
- **Proposed change** — the exact edit to make

Do not apply any changes until the user has reviewed the list.

## Phase 4: Apply

Apply only the items the user accepts. After applying, remind the user to run `sync-skills.sh` to propagate changes.

## Constraints

- Do not change the intent or scope of a skill without explicit instruction.
- When a cross-skill finding could be fixed in multiple ways, propose the simplest one.

When done, suggest running `/reflect` to capture any process improvements from the session.
