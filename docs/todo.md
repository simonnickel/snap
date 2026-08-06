# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-4: Move each rule into the file it belongs in

`AGENTS-shared.md` should hold only what is specific to the SNAP suite. `conventions.md` holds six topics in one file.

- `Collaboration` → `AGENTS-global.md`. "Ask before changing code. Propose first" already overlaps with `Proposing changes` there. "Use Xcode MCP when relevant" is Swift tooling, decide whether it fits a global file.
- `Changes` → `AGENTS-global.md`. The comment default duplicates `conventions/code-comments.md`, and checking for duplicate intent before adding to a doc file belongs in `conventions/documentation.md`. "The API should be general but implementations should be minimal" overlaps with `Scope`, which stays suite-specific.
- `Skill Conventions` → a new `conventions/skills.md`. Its reference to "the standard format defined in AGENTS.md" then points at `AGENTS-global.md`.
- Split `conventions.md`, following the split that produced `swift.md`, `code-comments.md` and `api-design.md`. `Code Structure`, `Multi-line indentation` and `Trailing commas` are all formatting and could share one file. `Service layer types` is naming and overlaps with `View Naming` in `swiftui.md`.
- List every new file in `conventions/index.md`, otherwise it does not load.
- Update `agents/README.md` to describe the result, including that `AGENTS-global.md` imports `conventions/index.md`.

## TODO-5: Settle the open documentation rules

- Decide whether one topic per file gets stated as a rule in `conventions/documentation.md`.
- Consider renaming `Module, checked in` in `conventions/documentation.md`. For a single-package repository the `<module>/` placeholder resolves to the root.
- Decide on a rule under `Structure` in `conventions/writing-style.md`: "Don't list a file in its own index or map."

## TODO-6: Rework the skills for the new structure

The skills still describe the layout from before the conventions moved out of `AGENTS-shared.md` into topic files.

- `snap-check-guidelines` audits both locations but has no criterion for deciding which one a rule belongs in. Write down the criterion the moves settled on. A section mixing suite-specific and generic content should be split, not left whole.
- `check-agents-md` needs checking against the `AGENTS.md` description in `conventions/documentation.md`.

## TODO-7: Audit

Run `/snap-check-guidelines`. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.
