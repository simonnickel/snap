---
name: snap-check
description: Suite-level audit of skill files and the shared AGENTS.md. Runs snap-check-skills and snap-check-agents-md in sequence.
---

Run the following skills in order:

1. `/snap-check-skills` — audit all skill files for quality and cross-skill consistency
2. `/snap-check-agents-md` — audit the shared AGENTS.md for quality and correctness
3. `/reflect` — capture any process improvements from the session

Complete each skill fully before starting the next.

## Constraints

- When running sub-skills, skip their suggestions to run `/reflect` — it runs as the final step.
