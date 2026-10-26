# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-11: Make snap-generic-analyse-todos work outside the suite

`snap-generic-analyse-todos` moved from `package` to `generic` and has to work in any project, including apps.
`snap-generic-pick-todo` relies on the same convention.

- Move the `Repository` section of `docs/documentation.md` into a global convention, so it can reference `todo/` and the common files in `docs/`.
- Replace the SPM-specific paths `Sources/` and `Package.swift`.
- Decide whether the skill scopes in `docs/suite/skills.md` and the layers in `docs/documentation.md` (Global, Suite, Repository) share one set of terms.

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
