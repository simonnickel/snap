---
name: check
description: Full audit of the current package: comments, README, AGENTS.md and skills. Runs check-comments, check-readme, check-agents-md, check-skills and reflect in sequence.
---

Run the following skills in order:

1. `/check-comments` — audit all source comments for typos, correctness, clarity, brevity and policy compliance
2. `/check-readme` — verify the README against the public API and update it
3. `/check-agents-md` — review and update the local AGENTS.md
4. `/check-skills` — audit all skill files for quality and cross-skill consistency
5. `/reflect` — capture any process improvements from the session

Complete each skill fully before starting the next.

## Constraints

- When running sub-skills, skip their suggestions to run `/reflect` because it runs as the final step.
