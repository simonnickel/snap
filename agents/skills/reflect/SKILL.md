---
name: reflect
description: Review the current conversation for learnings that should improve existing skills, AGENTS.md files, or memory. Use at the end of a session to capture non-obvious findings before they're lost.
---

**Goal:** review this conversation for anything worth persisting: corrections, validated approaches, new conventions or structural gaps in the agent setup.

## Process

1. **Identify candidates** — scan the conversation for:
   - Corrections to your approach ("no, don't do X")
   - Confirmed non-obvious choices ("yes, exactly")
   - Patterns or constraints established during the session
   - Gaps: something you had to discover that agent setup files should have covered

2. **Check existing files** to avoid redundancy:
   - Shared AGENTS.md and its imports
   - `../snap/conventions/` (all files)
   - Local AGENTS.md
   - Relevant skills in `../snap/agents/skills/`
   - Existing memory entries

3. **Propose changes** — for each finding, identify where it belongs:
   - **Memory** — user preferences or project context specific to this machine; not shared across machines, so avoid it for suite-wide conventions
   - **Local AGENTS.md** — package-specific architecture or conventions
   - **Shared AGENTS.md** — conventions that apply across all packages in the suite and all machines
   - **A skill** — a reusable process that would benefit future sessions

4. **Apply** after confirmation.

## Constraints

- Propose all changes together before applying any.
- If nothing meaningful was learned, say so — don't invent improvements.
- Don't add things already covered. Read the target file before proposing an addition.
- Prefer updating an existing entry over adding a new one.
