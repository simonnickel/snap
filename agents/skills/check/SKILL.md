---
name: check
description: Full audit of the current package: comments, README and AGENTS.md. Runs check-comments, check-readme, check-agents-md and reflect in sequence.
---

Run the following skills in order:

1. `/check-comments` — audit all source comments for typos, correctness, clarity, brevity and policy compliance
2. `/check-readme` — verify the README against the public API and update it
3. `/check-agents-md` — review and update the local AGENTS.md
4. `/reflect` — capture any process improvements from the session

Complete each skill fully before starting the next.

## Synthesis

After all sub-skills complete, before running reflect, cross-check the audited content for mutual consistency:
- Descriptions of types, behavior or constraints that differ between source comments and the README
- Conventions defined in AGENTS.md that source comments or the README violate or contradict
- Claims in the README that contradict what source comments document

Present any findings using the standard format defined in AGENTS.md.

## Constraints

- When running sub-skills, skip their suggestions to run `/reflect` because it runs as the final step.
