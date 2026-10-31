# Swift

## Language

- Swift 6 with strict concurrency.
- All changes must compile without warnings.

## Modeling

- Model data that a state requires as an associated value of its case, so invalid states cannot be constructed.

## Error handling

- No force unwraps outside tests, unless a comment justifies it.
- No `fatalError`. For an impossible state, use `assertionFailure` and fall back to a safe value.
- No `try?` that drops an error the caller could diagnose or recover from.
- Use typed `throws` where possible.

## Concurrency

- Avoid `@unchecked Sendable` and `nonisolated(unsafe)` unless internal synchronization is in place and documented on the type.

## Testing

- Tests use Swift Testing (`@Test`, `@Suite`), not XCTest.
- Public behavior is covered by tests.
- Prefer a parameterized `@Test(arguments:)` over near-duplicate tests.
- Test own logic, not framework behavior.
