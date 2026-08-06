# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-5: Settle the open documentation rules

- Decide whether one topic per file gets stated as a rule in `conventions/documentation.md`.
- Consider renaming `Module, checked in` in `conventions/documentation.md`. For a single-package repository the `<module>/` placeholder resolves to the root.
- Decide on a rule under `Structure` in `conventions/writing-style.md`: "Don't list a file in its own index or map."

## TODO-6: Rework the skills for the new structure

The skills still describe the layout from before the conventions moved out of `AGENTS-shared.md` into topic files.

- `snap-check-guidelines` audits both locations but has no criterion for deciding which one a rule belongs in. Write down the criterion the moves settled on. A section mixing suite-specific and generic content should be split, not left whole.
- `check-agents-md` needs checking against the `AGENTS.md` description in `conventions/documentation.md`.

## TODO-7: Rewrite the skill conventions

`conventions/skills.md` holds the phase structure copied from the old `Skill Conventions` section in `AGENTS-shared.md`. It was derived from how the skills were written, so it has to follow the rework rather than lead it.

- Check whether the phases still describe what the reworked skills do.
- Decide whether the file should also cover the naming prefixes currently in `agents/README.md`.

## TODO-8: Audit

Run `/snap-check-guidelines`. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.
