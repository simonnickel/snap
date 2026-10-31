---
name: snap-generic-pick-todo
description: Analyse one item of the project-level TODO list and recommend an option. Takes a TODO id or picks the next item and explains why.
argument-hint: [todo-id]
---

## Phase 1: Gather context

- Locate the project-level list defined by the loaded documentation conventions. Without one, ask the user.
- Pick the item named by the argument. Without an argument, choose one:
  - Read every open item.
  - Rule out items that depend on an unresolved item or wait on a condition that is not met yet.
  - Of the rest, prefer the earliest in the list, since the list is ordered by execution.
  - Prefer a later item only when resolving it first unblocks or simplifies others.
  - State the chosen item and the reasoning before continuing.
- Read the item, its details file if linked, and every file and item it references.

## Phase 2: Analyse

- Identify the open decisions in the item. An item without one has a single option: implementing it as described.
- For each decision, collect the options and weigh them against the loaded conventions and principles.
- Note dependencies on other items.

## Phase 3: Present

Present in this order:

1. Quote the full content of the item and its details file. Do not summarize or shorten it.
2. Summarize what to do about it: the recommendation and its tradeoffs.
3. Ask how to proceed. Typical options are shown below. Adjust them to fit the item:
   - **Implement**: apply the chosen option and remove the item once resolved.
   - **Record**: update the item with the decision, leaving it open.
   - **Delete**: remove the item without implementing it.
   - **Skip and next**: leave the item unchanged and continue with the next item, excluding the skipped ones.

## Constraints

- Analyse one item at a time.
