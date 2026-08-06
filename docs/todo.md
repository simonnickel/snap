# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-4: Small leftovers

- `agents/README.md` does not mention that `AGENTS-global.md` imports `conventions/index.md`.
- Decide on a rule under `Structure` in `conventions/writing-style.md`: "Don't list a file in its own index or map."
- Consider renaming `Module, checked in` in `conventions/documentation.md`. For a single-package repository the `<module>/` placeholder resolves to the root.

## TODO-5: Audit

Run `/snap-check-guidelines` once the moves settle. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.

## TODO-6: Rework the skills for the new structure

The skills still describe the layout from before the conventions moved out of `AGENTS-shared.md` into topic files.

- `snap-check-guidelines` audits both locations but has no criterion for deciding which one a rule belongs in. A section mixing suite-specific and generic content should be split, not left whole.
- `check-agents-md` needs checking against the `AGENTS.md` description in `conventions/documentation.md`.

## TODO-7: Split conventions.md into topic files

`conventions.md` holds `Principles`, `Dependencies`, `Code Structure`, `Multi-line indentation`, `Trailing commas` and `Service layer types` in one file. Each is its own topic, following the split that produced `swift.md`, `code-comments.md` and `api-design.md`.

- `Code Structure`, `Multi-line indentation` and `Trailing commas` are all formatting and could share one file.
- `Service layer types` is naming and overlaps with `View Naming` in `swiftui.md`.
- Decide whether one topic per file gets stated as a rule in `conventions/documentation.md`.
