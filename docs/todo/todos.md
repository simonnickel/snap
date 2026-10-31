# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-8: Audit

Run `/snap-suite-check`. The guidelines and conventions changed substantially, so the audit likely surfaces more than this list.

## TODO-12: Reconsider asking before changes

The rule "Propose changes first, implement after confirmation." was removed from `agents/AGENTS-global.md` in `398d328`.

- Decide whether to bring it back, based on how sessions go without it.

## TODO-14: Reconsider the question dialog

`## Asking questions` in `agents/AGENTS-global.md` rules out the AskUserQuestion tool. In Claude Code 2.1.311, the content before the dialog was often not posted: the agent wrote it into thinking instead of text.

- Waits on a newer Claude Code version.
- Try `snap-generic-pick-todo` with the dialog again and check that the full item shows before it.
- Bring the dialog back if it does.
