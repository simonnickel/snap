# TODO

Outstanding work on the suite.

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

`snap-foundation` has a `SwiftUI+UIKit` folder of extensions, while `docs/suite/packages-overview.md` describes it as extensions for Swift and Foundation and assigns SwiftUI and UIKit to `snap-core`.

- Decide whether the code moves to `snap-core` or the overview changes.
- Apply the change in the affected repository, and to the snap-foundation description in `README.md`.

## TODO-20: Publish the package collection

`packages.json` defines the suite's package collection. It is not published yet.

- Build the [Generator](https://github.com/swiftlang/swift-package-collection-generator) with `swift build --configuration release`.
  - As of 2026-10, it declares `.macOS(.v13)` but depends on `swift-package-manager` `main`, which requires macOS 15. Change the platform in its `Package.swift` to `.macOS("15.0")` until this is fixed upstream.
- Decide when to publish. The collection lists only tagged versions, and every package is at `0.1.0`, older than `main`.
- Create a Swift Package Collection certificate in the Apple Developer portal. Export its key from Keychain Access as `.p12` and convert it to an RSA key:
  `openssl pkcs12 -nocerts -in Certificates.p12 -out key.pem && openssl rsa -in key.pem -out rsa_key.pem`
- Generate the collection from `packages.json` with `package-collection-generate`, then sign it with `package-collection-sign`.
- Decide where to host the signed `collection.json`, e.g. as a raw GitHub file in this repository.
- Update `## Package Collections` in `README.md` with the collection URL.

## TODO-21: Migrate TODO and workaround comments

`docs/conventions/code-comments.md` replaced tagged `// TODO <xyz>:` comments with items on the TODO list, marked in source with `// TODO-<n>:`, and with workaround comments. The packages still use the old formats.

- Rewrite workarounds as workaround comments: `// TODO FB:` comments, comments starting with a Feedback number, such as `// FB19669133: …`, and doc comments with a `Workaround:` line.
- Move `// TODO finetuning:` and `// TODO idea:` comments to the package's TODO list, or drop them.
- Treat other tags, such as `macOS` or `feature`, and plain `// TODO:` comments on main the same way.
- `snap-generic-analyze-todos` covers this per package, through its check of existing TODOs.
