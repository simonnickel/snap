# Next Steps

Outstanding work after moving the global agent config into `conventions/` and reducing `AGENTS-shared.md` to suite-specific content.

## 3. Give snap/docs/ its architecture content

`conventions/documentation.md` and `AGENTS-shared.md` both point at `snap/docs/`. The suite description and package table at the top of `AGENTS-shared.md` are architecture living in an agent file and belong here instead.

## 4. Small leftovers

- `agents/README.md` does not mention that `AGENTS-global.md` imports `conventions/index.md`.
- Decide on a rule under `Structure` in `conventions/writing-style.md`: "Don't list a file in its own index or map."
- Consider renaming `Module, checked in` in `conventions/documentation.md`. For a single-package repository the `<module>/` placeholder resolves to the root.

## 5. Audit

Run `/snap-check-guidelines` once the moves settle. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.
