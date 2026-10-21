---
name: snap-package-check
description: Maintain the comments, README and AGENTS.md of the current package. Runs snap-generic-check-comments, snap-package-check-readme and snap-package-check-agents-md in sequence.
---

## Phase 1: Run the skills

Run the following skills in order, completing each before starting the next:

1. `/snap-generic-check-comments`
2. `/snap-package-check-readme`
3. `/snap-package-check-agents-md`

## Phase 2: Analyse

Check the comments, README and `AGENTS.md` together for:
- Duplication: the same content in more than one place
- Overlap: content or workflows that partly cover the same topic
- Contradictions: statements that disagree
- Inconsistent terms: one concept named differently

## Phase 3: Present findings

Present findings using the standard format defined in `AGENTS-global.md`.
