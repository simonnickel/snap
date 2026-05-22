---
name: snap-check-skills
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
- Claims about other skills are accurate and references use correct names (e.g. `/check-comments`)
- AGENTS.md conventions are followed
- Frontmatter `name` matches the folder name and `description` accurately reflects the skill's scope
- Standalone skills end with the `/reflect` suggestion (composite skills that run reflect as a step omit it)
- For composite skills, the frontmatter `description` lists the same sub-skills as the body's step list

**Completeness**
- The skill's scope and goal are explicit and consistent with the frontmatter `description`
- Constraints section covers the non-obvious limits of the skill's scope
- Skills that collect findings instruct the agent to complete the full analysis before presenting
- Skills that modify files have an explicit "do not apply until confirmed" gate
- Skills that present multiple findings reference the standard format defined in AGENTS.md

**Clarity**
- Goal is stated clearly
- Instructions are unambiguous and actionable
- Phases or steps are in a logical order

**Brevity**
- No redundant content
- No instructions that restate the obvious

**Gaps** — tasks or scenarios not covered, including missing cross-references between skills that overlap in scope

**Redundancies** — content duplicated that could live in one place

**Conflicts** — instructions that contradict each other

**Ambiguities** — instructions with more than one reasonable reading

**Scope issues** — a skill doing too much, or doing things that belong to another skill

**Stale references** — references to skills, paths or files that don't exist or have been renamed. Verify a path or skill actually exists before flagging it.

**Naming discrepancies** — the same concept referred to by different terms, or inconsistent section names, phase structures or tone

## Phase 3: Present findings

Present findings using the standard format defined in AGENTS.md.

## Phase 4: Apply

Apply only the items the user accepts. After applying, remind the user to run `sync-skills.sh` to propagate changes.

## Constraints

- Do not change the intent or scope of a skill without explicit instruction.
- When a cross-skill finding could be fixed in multiple ways, propose the simplest one.
- Do not propose adding check bullets that restate rules already in AGENTS.md.

When done, suggest running `/reflect` to capture any process improvements from the session.
