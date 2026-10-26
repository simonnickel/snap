# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-5: Settle the open documentation rules

- Decide whether one topic per file gets stated as a rule in `docs/documentation.md`.
- Consider renaming `Module` in `docs/documentation.md`. For a single-package repository the `<module>/` placeholder resolves to the root.
- Decide on a rule under `Structure` in `docs/conventions/writing-style.md`: "Don't list a file in its own index or map."
- `Common files in docs/` in `docs/documentation.md` places `mission-statement.md` and `todo.md` directly in `docs/`, while `snap` uses `suite/` and `plans/`. Decide whether packages follow the subfolder layout.
- Decide whether the README entry in `docs/documentation.md` requires linking to the package's `docs/`, e.g. a guide per topic or the DocC documentation.

## TODO-11: Make snap-generic-analyse-todos work outside the suite

`snap-generic-analyse-todos` moved from `package` to `generic` and has to work in any project, including apps.

- Move the `Module` section of `docs/documentation.md` into a global convention, so it can reference `todo.md` and the common files in `docs/`.
- Replace the SPM-specific paths `Sources/` and `Package.swift`.
- Decide whether the skill scopes in `docs/suite/skills.md` and the layers in `docs/documentation.md` (Global, Suite, Module) share one set of terms.

## TODO-7: Rewrite the skill conventions

`docs/suite/skills.md` holds the phase structure copied from the old `Skill Conventions` section in `AGENTS-shared.md`. It was derived from how the skills were written, so it has to follow the rework rather than lead it.

- Check whether the phases still describe what the reworked skills do.

## TODO-10: Consider importing more docs

`AGENTS-shared.md` imports only `mission-statement.md`, `packages-overview.md` and `documentation.md`. Decide whether more docs should load in every session, e.g. `agent-setup.md`, or stay referenced only.

## TODO-8: Audit

Run `/snap-suite-check`. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.

## TODO-12: Reconsider asking before changes

The rule "Propose changes first, implement after confirmation." was removed from `agents/AGENTS-global.md` in `398d328`.

- Decide whether to bring it back, based on how sessions go without it.

## TODO-13: Add a skill to analyse a TODO

A skill that picks one item from `todo.md`, analyses the options and recommends one.

- Takes the TODO id as an argument. Decide how to pick one without it, e.g. the first item.
- Decide on the scope. `generic` fits once `todo.md` is a global convention (TODO-11).
- Presents the options and tradeoffs following `## Decisions` in `AGENTS-global.md`.
