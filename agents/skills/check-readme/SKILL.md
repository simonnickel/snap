---
name: check-readme
description: Review and improve the README of the current project. Use when the user asks to check, audit, verify, or update a README — especially when correctness against the public API matters.
---

Review and improve the README of the current project.

Goal: a README that is **correct, precise, complete, and as short as possible** — in that order. Cut words, not information.

## Process

1. **Read the README** end to end.
2. **Read the public API** to ground every claim against real code:
   - Swift package: `Sources/`, public types, doc comments, `Package.swift`.
   - Other languages: equivalent entry points and exported surfaces.
3. **Cross-check every code sample** in the README:
   - Do type and method names match the current code?
   - Do the samples follow the patterns recommended in doc comments?
4. **Verify all internal links and paths** resolve (demo folders, screenshots, anchor links).
5. **Summarise issues found** before editing, grouped by category (correctness / spelling / ambiguity / completeness / brevity). Do not start editing until the summary is shown.
6. **Apply edits** to the README only. Do not modify source code unless the user explicitly asks.
7. **Build the project** after edits to confirm any in-README code that mirrors real types still compiles, if a build tool is available.

## Categories to check

**Correctness** — every claim matches the code:
- Public API names, signatures, and observable behavior.
- Error handling: which paths trap, which recover; isolation and concurrency guarantees.
- Platform / OS / language version requirements.
- Test and preview affordances; when overrides or resets are allowed.

**Spelling and grammar** — preserve the existing dialect (UK / US) if consistent; flag inconsistencies.

**Ambiguity** — any sentence with two reasonable readings is rewritten so only one is possible.

**Completeness** — the README lists, at minimum:
- Every public feature.
- Every non-obvious limitation that would surprise a new user.
- Every design choice that explains *why* a feature behaves the way it does (locking strategy, lifetime model, error policy, isolation guarantees, lifecycle/scoping rules, etc.).
- The smallest example needed to use each feature.

**Brevity** — as short as possible while keeping all of the above:
- Prefer bullets over prose where it shortens without losing nuance.
- Drop filler ("simple", "easy", "powerful") unless backed by a concrete claim.
- Combine examples that demonstrate the same idea.
- No marketing voice; no emojis unless already used.

## Constraints

- Do not invent features. If a behavior is unclear from code, ask before documenting.
- Do not remove badges, links, or licensing references unless they're broken or outdated.
- Keep tone consistent with the existing README.
- Do not introduce a "we" voice or first-person perspective unless already used.

## Output

1. A short, categorised summary of issues found.
2. The edits applied to the README.
3. A build confirmation, or — if the edit revealed real drift between README and code — a list of the drift for the user to decide on.
