# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-5: Settle the open documentation rules

- Decide whether one topic per file gets stated as a rule in `docs/documentation.md`.
- Consider renaming `Module` in `docs/documentation.md`. For a single-package repository the `<module>/` placeholder resolves to the root.
- Decide on a rule under `Structure` in `docs/conventions/writing-style.md`: "Don't list a file in its own index or map."
- `Common files in docs/` in `docs/documentation.md` places `mission-statement.md` and `todo.md` directly in `docs/`, while `snap` uses `suite/` and `plans/`. Decide whether packages follow the subfolder layout.

## TODO-11: Decide the scope of package skills

Most `snap-package-*` skills do not depend on suite docs. Their criteria live in the global conventions, so they could work in any project.

- Decide whether `snap-package-check-comments` and `snap-package-check-readme` become `generic`. Their only package assumptions are the `Sources/` path, Swift comment syntax and reading the public API.
- Decide what `package` means in `docs/suite/skills.md`: a skill operating on a SNAP package, or one depending on suite docs.
- Decide whether the skill scopes in `docs/suite/skills.md` and the layers in `docs/documentation.md` (Global, Suite, Module) share one set of terms.

## TODO-6: Rework the skills for the new structure

The skills still describe the layout from before the conventions moved out of `AGENTS-shared.md` into topic files.

- `snap-package-check-agents-md` needs checking against the `AGENTS.md` description in `docs/documentation.md`.
- `snap-package-check-agents-md` Phase 1: drop the `setup.sh --check` step (setup belongs to the script) and merge the `AGENTS-shared.md` and `/context` steps into one check that the setup is loaded.
- `snap-package-check-agents-md` checks the package import itself, the script no longer does. Allow the import at the end of the file instead of requiring it as the first line, and decide on one position for the template.

## TODO-7: Rewrite the skill conventions

`docs/suite/skills.md` holds the phase structure copied from the old `Skill Conventions` section in `AGENTS-shared.md`. It was derived from how the skills were written, so it has to follow the rework rather than lead it.

- Check whether the phases still describe what the reworked skills do.

## TODO-10: Consider importing more docs

`AGENTS-shared.md` imports only `mission-statement.md`, `packages-overview.md` and `documentation.md`. Decide whether more docs should load in every session, e.g. `agent-setup.md`, or stay referenced only.

## TODO-8: Audit

Run `/snap-suite-check`. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.
