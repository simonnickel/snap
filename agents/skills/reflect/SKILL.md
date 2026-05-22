---
name: reflect
description: Review the current conversation for learnings that should improve existing skills, AGENTS.md files or memory. Use at the end of a session to capture non-obvious findings before they're lost.
---

**Goal:** review this conversation for anything worth persisting: corrections, validated approaches, new conventions or structural gaps in the agent setup.

## Process

1. **Identify candidates** — scan the conversation for:
   - Corrections to your approach ("no, don't do X")
   - Confirmed non-obvious choices (explicit confirmation or absence of pushback on an unusual approach)
   - Patterns or constraints established during the session
   - Gaps: something you had to discover that agent setup files should have covered

2. **Check existing files** to avoid redundancy:
   - Shared AGENTS.md and its imports
   - `../snap/conventions/` (all files)
   - Local AGENTS.md
   - Skills in `../snap/agents/skills/` that overlap in scope with the proposed addition
   - Existing memory entries

3. **Propose changes** — for each finding, identify where it belongs:
   - **Memory** — user preferences or project context specific to this machine; not shared across machines, so avoid it for suite-wide conventions
   - **Local AGENTS.md** — package-specific architecture or conventions
   - **Shared AGENTS.md** — conventions that apply across all packages in the suite and all machines
   - **A skill** — a reusable multi-step workflow that would benefit future sessions

4. **Apply** the changes. Present all findings first, then apply each to its target file once the user confirms.

## Constraints

- If nothing meaningful was learned, say so. Don't invent improvements.
- Don't add things already covered. Read the target file before proposing an addition.
- Prefer updating an existing entry over adding a new one.
