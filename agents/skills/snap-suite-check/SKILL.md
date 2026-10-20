---
name: snap-suite-check
description: Suite-level audit of skill files and guidelines. Runs snap-suite-check-skills, snap-suite-check-guidelines and snap-generic-reflect in sequence.
---

Run the following skills in order:

1. `/snap-suite-check-skills` — audit all skill files for quality and cross-skill consistency
2. `/snap-suite-check-guidelines` — audit `AGENTS-shared.md` and conventions for quality and correctness
3. `/snap-generic-reflect` — capture any process improvements from the session

Complete each skill fully before starting the next.

## Synthesis

After all sub-skills complete, before running reflect, cross-check skill files and guidelines for mutual consistency:
- Skills that violate or contradict the conventions they are supposed to follow
- Conventions not reflected in any skill's checks or scope
- Guidelines that conflict with what skills actually audit

Present any findings using the standard format defined in `AGENTS-shared.md`.

## Constraints

- When running sub-skills, skip their suggestions to run `/snap-generic-reflect` because it runs as the final step.
