# The SNAP Suite

SNAP (SN App Packages) is a set of Swift libraries for building iOS apps. `snap/` is the coordinating repository; the packages live alongside it as individual git repositories.

## Packages

| Package | Purpose | Depends on |
|---|---|---|
| `snap-foundation` | Extensions for Swift, Foundation and OSLog | — |
| `snap-core` | SwiftUI/UIKit extensions, helpers and workarounds | snap-foundation |
| `snap-style` | Semantic styling system (colors, fonts, spacing) for SwiftUI | snap-foundation, snap-core |
| `snap-settings-service` | Settings storage: Codable values in UserDefaults, iCloud KV or custom store | snap-core |
| `snap-navigation` | SwiftUI navigation structure decoupled from presentation | snap-foundation |
| `snap-dependencies` | Dependency injection container | snap-foundation |
| `snap-swift-data` | SwiftData/CoreData interoperability and Persistent History Tracking | — |
| `snap-template` | Shared app code and demo project | snap-core, snap-style, snap-settings-service, snap-navigation, snap-dependencies |

Dependencies run one way, toward `snap-foundation`.

- Feature packages never depend on each other. Shared code moves down into `snap-core` or `snap-foundation`.
- `snap-template` is the only package that combines features.
- `snap-swift-data` has no dependency in the suite. An app consumes it directly.

## Documentation

Any documentation about the suite lives in `snap/docs/`.

# Agent Instructions

## Scope

These are Swift library packages intended for arbitrary consumption (any app or package, unknown at the time of writing). Design decisions must hold up across a wide range of usage contexts.

- Unreleased. Changing public API is fine.
- The demo exists to verify integration, not to drive design. Never constrain or shape the API around how the demo uses it.

## Agent Setup

The expected setup is described in `snap/docs/agent-setup.md` and applied by `snap/agents/setup.sh`. Re-run the script after changing a skill in `snap/agents/skills/`.
