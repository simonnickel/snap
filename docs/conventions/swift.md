# Swift

## Language

- Swift 6 with strict concurrency.
- All changes must compile without warnings.

## Error handling

- No force unwraps outside tests, unless a comment justifies it.
- No `fatalError`. For an impossible state, use `assertionFailure` and fall back to a safe value.
- No `try?` that drops an error the caller could diagnose or recover from.

## Concurrency

- Prefer `actor`, `@MainActor` or `OSAllocatedUnfairLock`.
- Avoid `@unchecked Sendable` unless internal synchronization is in place and documented on the type.

## Testing

- Tests use Swift Testing (`@Test`, `@Suite`), not XCTest.
- Public behavior is covered by tests.
