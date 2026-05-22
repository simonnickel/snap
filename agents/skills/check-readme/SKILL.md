---
name: check-readme
description: Review and improve the README of the current project. Use when the user asks to check, audit, verify or update a README, especially when correctness against the public API matters.
---

Review and improve the README of the current project.

**Goal:** a README that is **correct, precise, complete and brief** (in that order).

## Phase 1: Gather context

1. **Read the README** end to end.
2. **Read the public API** to ground every claim against real code:
   - Swift package: `Sources/`, public types, doc comments, `Package.swift`.
   - Other languages: equivalent entry points and exported surfaces.
3. **Cross-check every code sample** in the README:
   - Do type and method names match the current code?
   - Do the samples follow the patterns recommended in doc comments?
4. **Verify all internal links and paths** resolve (demo folders, screenshots, anchor links).

## Phase 2: Analyse

Check every claim against each category:

**Correctness** — every claim matches the code:
- Public API names, signatures and observable behavior.
- Error handling: which paths trap, which recover.
- Isolation and concurrency guarantees.
- Platform / OS / language version requirements.
- Test and preview affordances.
- When overrides or resets are allowed.

**Spelling and grammar** — prefer US spelling.

**Ambiguity** — any sentence with two reasonable readings is rewritten so only one is possible.

**Completeness** — the README lists, at minimum:
- Every public feature. Exception: for packages of independent utilities with no shared architecture, prefer generic section summaries over listing every public type. Feature discoverability is left to the API documentation.
- Every non-obvious limitation that would surprise a new user.
- Every design choice that explains *why* a feature behaves the way it does (locking strategy, lifetime model, error policy, isolation guarantees, lifecycle/scoping rules, etc.).
- The smallest example needed to use each feature.
- Platform / OS / language version / package dependencies requirements stated in the README body (not only in badges).

**Brevity** — as short as possible while keeping all of the above:
- Prefer bullets over prose where it shortens without losing nuance.
- Drop filler ("simple", "easy", "powerful") unless backed by a concrete claim.
- Combine examples that demonstrate the same idea.
- No marketing voice and no emojis unless already used.

## Phase 3: Present

Summarise issues found before editing, grouped by category (correctness / spelling / ambiguity / completeness / brevity). Do not start editing until the summary is shown. Suggest going through them one by one.

## Phase 4: Apply

Apply edits to the README only. Do not modify source code unless the user explicitly asks.

## Constraints

- Do not invent features. If a behavior is unclear from code, ask before documenting.
- Do not remove badges, links, or licensing references unless they're broken or outdated.
- Keep tone consistent with the existing README.
- Do not introduce a "we" voice or first-person perspective unless already used.
- Do not remove TODO/FIXME items. Preserve them as in source code unless explicitly asked to remove.

When done, suggest running `/reflect` to capture any process improvements from the session.
