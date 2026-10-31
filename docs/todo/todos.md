# TODO

Outstanding work on the agent setup, conventions and documentation structure.

## TODO-12: Reconsider asking before changes

The rule "Propose changes first, implement after confirmation." was removed from `agents/AGENTS-global.md` in `398d328`.

- Decide whether to bring it back, based on how sessions go without it.

## TODO-14: Reconsider the question dialog

`## Asking questions` in `agents/AGENTS-global.md` rules out the AskUserQuestion tool. In Claude Code 2.1.311, the content before the dialog was often not posted: the agent wrote it into thinking instead of text.

- Waits on a newer Claude Code version.
- Try `snap-generic-pick-todo` with the dialog again and check that the full item shows before it.
- Bring the dialog back if it does.

## TODO-15: Code of Conduct

Add a Code of Conduct to the package template, e.g. the [Contributor Covenant](https://www.contributor-covenant.org).

## TODO-16: Review reference docs

`docs/todo/reference/` holds docs, skills and agent setup from another project. It is excluded locally in `.git/info/exclude` and never committed.

- Go through the files one by one, one file per reply.
- Check each file for content to add to the docs, conventions, skills or agent setup, or an approach to take inspiration from.
- Present the findings and discuss each one before changing anything.
- Decide on every finding within the current file. Don't hold one back because a later file might cover it.
- Apply only what is decided.
- Delete the file once reviewed.
- Remove this item and the exclude entry once the folder is empty.

## TODO-17: Claude Code permissions

Decide whether to add permission rules to the Claude Code settings:

- Allow `mcp__xcode__*`, so building and testing through Xcode MCP needs no permission prompt.
- Deny `Edit` on `.claude/settings.json`, `.claude/settings.local.json` and `.mcp.json`, so the agent cannot widen its own permissions. Check first how far Claude Code already protects these files.
- Decide where they live: the user `~/.claude/settings.json`, or a versioned file distributed by `setup.sh`.
