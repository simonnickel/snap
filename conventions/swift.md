# Swift

## Language

- Swift 6 with strict concurrency.
- All changes must compile without warnings.

## Concurrency

- Prefer `actor`, `@MainActor` or `OSAllocatedUnfairLock`.
- Avoid `@unchecked Sendable` unless internal synchronization is in place and documented on the type.

## Testing

- Tests use Swift Testing (`@Test`, `@Suite`), not XCTest.
