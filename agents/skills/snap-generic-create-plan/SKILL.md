---
name: snap-generic-create-plan
description: Create a plan for a goal in the current project, following the project's documentation style. Resolves open questions before writing. Does not implement anything. Use for requests to plan a goal or turn a TODO into a plan.
argument-hint: <goal>
---

## Phase 1: Gather context

- Take the goal from the argument. Without one, ask the user.
- Determine where plans are recorded, as defined by the loaded documentation conventions. Without one, ask the user.
- Read the code and documentation the goal touches.

## Phase 2: Analyze

- Find the open questions the steps depend on: unclear scope, missing requirements or a choice between valid approaches.
- Find parts of the goal that could be implemented and reviewed independently.

## Phase 3: Present

- Ask the open questions, one per reply.
- When the user leaves a decision open, make it and state it in the plan.
- Propose splitting independent parts into separate plans.
- Propose the file name.

## Phase 4: Write the plan

- Write the plan once every question is resolved, following the loaded documentation conventions.
- For a split, write one plan per part.

## Constraints

- Create or edit only the plan files.
- Do not implement anything.
