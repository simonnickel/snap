# Packages Overview

The packages of the SNAP suite and how they depend on each other.

| Package | Purpose | Depends on |
|---|---|---|
| `snap-foundation` | Extensions for Swift, Foundation and OSLog | — |
| `snap-core` | Extensions for Swift, SwiftUI and UIKit, helpers and workarounds | snap-foundation |
| `snap-style` | Semantic styling system (colors, fonts, spacing) for SwiftUI | snap-foundation, snap-core |
| `snap-settings-service` | Settings storage: Codable values in UserDefaults, iCloud KV or custom store | snap-core |
| `snap-navigation` | SwiftUI navigation structure decoupled from presentation | snap-foundation |
| `snap-dependencies` | Dependency injection container | snap-foundation |
| `snap-swift-data` | SwiftData/CoreData interoperability and Persistent History Tracking | — |
| `snap-template` | Shared app code and demo project | snap-core, snap-style, snap-settings-service, snap-navigation, snap-dependencies |

## Dependencies

Dependencies run one way, toward `snap-foundation`.

- Feature packages never depend on each other. Shared code moves down into `snap-core` or `snap-foundation`.
- `snap-template` is the only package that combines features.
- `snap-swift-data` has no dependency in the suite. An app consumes it directly.
