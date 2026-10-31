---
name: snap-generic-analyse-todos
description: Analyse the current project or a given part of it for improvements and record them as TODOs, following the project's documentation style. Does not fix anything. Use for requests to find improvements or record TODOs.
argument-hint: [scope]
---

## Scope

The arguments name the part of the project to cover. Without an argument, the whole project is covered.

Findings are limited to the scope. Code outside it is read only where needed to understand the code in scope.

## Phase 1: Gather context

- Read the manifest and every source and test file in scope.
- Collect every existing `TODO` and `FIXME` comment with its file and line.
- Determine where findings are recorded: the project-level list defined by the loaded documentation conventions. Without one, the list the project already uses. Without either, ask the user.
- Places in source that an item relates to are marked as defined by the loaded comment conventions.
- Read the project-level list.

## Phase 2: Analyse

Complete the full analysis before presenting anything.

**Correctness** (`snap/docs/conventions/swift.md`)
- Incorrect or incomplete behavior
- Missing edge-case handling at system boundaries (user input, external APIs, persistence)
- Concurrency issues: data races, actor isolation, `@unchecked Sendable` without documented synchronization
- Code that compiles with warnings

**Efficiency**
- Inefficient patterns with a clear better alternative

**Architecture** (`snap/docs/conventions/principles.md`, `snap/docs/conventions/api-design.md`)
- Coupling between modules, features or layers that should be independent
- Responsibilities that belong in a different type
- Assumptions about the consumer's architecture, threading model or lifecycle
- Patterns that will not hold up as the project grows
- External dependencies that a simpler built-in solution could replace

**API design** (`snap/docs/conventions/api-design.md`, `snap/docs/conventions/naming.md`, `snap/docs/conventions/swiftui.md`)
- Names that don't follow the Swift API Design Guidelines or the project's naming patterns
- Public API that is easy to misuse, where a compile-time error could replace a runtime failure
- Public API larger than the problem needs
- View modifiers without an inert variant

**Clarity** (`snap/docs/conventions/principles.md`)
- Code flow that takes significant effort to follow
- Implicit behavior that should be explicit
- Names that obscure intent

**Tests** (`snap/docs/conventions/swift.md`)
- Public behavior without test coverage
- Tests not using Swift Testing

**Guideline compliance**
- Violations of the loaded conventions not covered above or by `/snap-generic-check-comments`

**Existing TODOs**
- Items that are resolved or no longer valid
- Items not clear enough to act on without reading the surrounding code
- Items that should move between source and the project-level list
- Items that should be split, merged with a related item or removed

## Phase 3: Present

Present findings. State for each finding where it is recorded.

## Constraints

- Do not fix anything. Only record findings as TODOs.
