---
name: snap-package-check
description: Full audit of the current package: comments, README and AGENTS.md. Runs snap-package-check-comments, snap-package-check-readme, snap-package-check-agents-md and snap-generic-reflect in sequence.
---

Run the following skills in order:

1. `/snap-package-check-comments` — audit all source comments for typos, correctness, clarity, brevity and policy compliance
2. `/snap-package-check-readme` — verify the README against the public API and update it
3. `/snap-package-check-agents-md` — review and update the local AGENTS.md
4. `/snap-generic-reflect` — capture any process improvements from the session

Complete each skill fully before starting the next.

## Synthesis

After all sub-skills complete, before running reflect, cross-check the audited content for mutual consistency:
- Descriptions of types, behavior or constraints that differ between source comments and the README
- Conventions defined in AGENTS.md that source comments or the README violate or contradict
- Claims in the README that contradict what source comments document

Present any findings using the standard format defined in AGENTS.md.

## Constraints

- When running sub-skills, skip their suggestions to run `/snap-generic-reflect` because it runs as the final step.
