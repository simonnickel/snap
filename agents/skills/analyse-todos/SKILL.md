---
name: analyse-todos
description: Scan the whole project for improvements in implementation, architecture, API, clarity, refactoring and guideline compliance. Records findings as TODO comments in source or as bullets in the README TODO section.
---

Scan the project for improvements and record actionable findings.

**Goal:** a list of concrete code-level and structural improvements. Each finding becomes either a `// TODO:` comment in source (single-file or localised change) or a bullet in the README `## TODO` section (cross-file, architectural or feature-level work). Both placements are valid when a finding has both a local and a broader dimension.

## Phase 1: Gather context

Read in full:
- `Package.swift` and `README.md`
- All files in `Sources/`
- All existing `// TODO:` and `// FIXME:` comments, noting file and line for each
- `AGENTS.md` (shared and local) for guidelines

## Phase 2: Analyse

Complete the full analysis before presenting anything.

**Implementation**
- Incorrect or incomplete behaviour
- Missing edge-case handling at system boundaries (user input, external APIs)
- Inefficient patterns with a clear better alternative

**Architecture**
- Coupling between layers that should be separate
- Responsibilities that belong in a different type
- Patterns that will not scale as the package grows

**API design**
- Names that don't match Swift API Design Guidelines or the project's naming patterns
- Public API that is easy to misuse. Prefer compile-time errors over runtime ones.
- Missing conveniences a consumer would reasonably expect

**Clarity**
- Code flow that requires significant effort to follow
- Names that obscure intent

**Guideline compliance**
- Violations of any rule in `AGENTS.md` (shared and local) not already caught by `/check-comments`

**Existing TODOs**
- Is the item still valid, or has it already been resolved?
- Is the text clear enough to act on without reading the surrounding code?
- Is it placed correctly? Source for local changes, README for broader work.
- Should it be promoted from source to the README, or demoted?
- Should it be split into multiple items or merged with a related one?
- Should it be removed entirely: resolved, obsolete or no longer aligned with the design intent?

## Phase 3: Present findings

Show all findings as a numbered list, sorted by priority (correctness and broken behaviour first, then architecture, API design, clarity, guideline compliance, existing TODO quality last). For each item:
- **Category** — one of the categories above
- **Location** — file path + line, or "README"
- **Finding** — description of the problem
- **Proposed text** — the exact `// TODO:` comment or README bullet to add, or the rewritten text for an existing TODO
- **Placement** — Source, README, Both, or Rewrite (for existing TODOs)

Do not apply any changes until the user has reviewed the list.

## Phase 4: Apply

Apply only the items the user accepts. For source TODOs, insert the comment immediately above the relevant declaration or block. For README bullets, append to the `## TODO` section, creating it if absent.

## Constraints

- Do not fix anything. Only record findings as TODOs.
