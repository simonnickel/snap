# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-7: Rewrite the skill conventions

`docs/suite/skills.md` holds the phase structure copied from the old `Skill Conventions` section in `AGENTS-shared.md`. It was derived from how the skills were written, so it has to follow the rework rather than lead it.

- Check whether the phases still describe what the reworked skills do.

## TODO-10: Consider importing more docs

`AGENTS-shared.md` imports only `mission-statement.md`, `packages-overview.md` and `skills.md`. Decide whether more docs should load in every session, e.g. `agent-setup.md`, or stay referenced only.

## TODO-8: Audit

Run `/snap-suite-check`. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.

## TODO-12: Reconsider asking before changes

The rule "Propose changes first, implement after confirmation." was removed from `agents/AGENTS-global.md` in `398d328`.

- Decide whether to bring it back, based on how sessions go without it.
