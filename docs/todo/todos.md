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

## TODO-17: Claude Code permissions and Xcode MCP

Decide whether to add permission rules to the Claude Code settings:

- Allow `mcp__xcode__*`, so building and testing through Xcode MCP needs no permission prompt.
- Deny `Edit` on `.claude/settings.json`, `.claude/settings.local.json` and `.mcp.json`, so the agent cannot widen its own permissions. Check first how far Claude Code already protects these files.
- Decide where they live: the user `~/.claude/settings.json`, or a versioned file distributed by `setup.sh`.

Decide whether to bring back the rule to use Xcode MCP for building and testing. It was removed from `agents/AGENTS-global.md`, since the server was not set up on the machine.

- Set up the server:
  1. In Xcode > Settings > Intelligence, enable "Allow external agents to use Xcode tools". The label is unverified.
  2. Register it for all projects: `claude mcp add --scope user xcode -- xcrun mcpbridge`.
  3. Open the project in Xcode and approve the connection prompt.
- If the rule comes back, list the registration under "Expected setup" in `docs/suite/agent-setup.md`.

## TODO-18: Verify stored view content

`## View composition` in `docs/conventions/swiftui.md` prefers storing content built in `init` over a `@ViewBuilder` closure. The claim that SwiftUI cannot compare closures, and therefore updates the view on every parent update, is unverified.

- Verify it, for example with `Self._printChanges()` or Instruments on a container in both forms.
- If it holds, migrate the package types that store a builder closure without a reason for it, such as `ScrollViewWith` in `snap-core` and `StyleScreen` in `snap-style`.
- If it does not, remove the rule and revert `code-reference/Container.swift`.

## TODO-19: SwiftUI and UIKit code in snap-foundation

`snap-foundation` has a `SwiftUI+UIKit` folder of extensions, while `docs/suite/packages-overview.md` lists only Swift, Foundation and OSLog for it and assigns SwiftUI and UIKit to `snap-core`.

- Decide whether the code moves to `snap-core` or the overview changes.
- Apply the change in the affected repository.
