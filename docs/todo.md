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
- `check-agents-md` Phase 1: drop the `setup.sh --check` step (setup belongs to the script) and merge the `AGENTS-shared.md` and `/context` steps into one check that the setup is loaded.
- `check-agents-md` checks the package import itself, the script no longer does. Allow the import at the end of the file instead of requiring it as the first line, and decide on one position for the template.

## TODO-7: Rewrite the skill conventions

`conventions/skills.md` holds the phase structure copied from the old `Skill Conventions` section in `AGENTS-shared.md`. It was derived from how the skills were written, so it has to follow the rework rather than lead it.

- Check whether the phases still describe what the reworked skills do.
- Decide whether the file should also cover the skill name prefixes currently in `docs/agent-setup.md`.

## TODO-9: Prefix every skill with `snap-`

Replace the `.snap-skills` tracking in `setup.sh`. Once every skill is named `snap-*`, the script owns everything with that prefix in each skill folder, so it can remove all `snap-*` folders and copy the source skills fresh without tracking anything.

- Rename all skills, including the unprefixed ones and `sn-proofread`, and update references to them.
- The prefixes in `docs/agent-setup.md` currently express scope (package, suite, generic). Decide how scope is shown instead, which also settles the prefix question in TODO-7.
- Remove the manifest handling from `setup.sh` and the `.snap-skills` files from each skill folder, and update `docs/agent-setup.md`.

## TODO-8: Audit

Run `/snap-check-guidelines`. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.
