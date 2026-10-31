# Swift

## Language

- Swift 6 with strict concurrency.
- All changes must compile without warnings.

## Modeling

- Model data that a state requires as an associated value of its case, so invalid states cannot be constructed.

## Closures

- Name closure parameters instead of using `$0` and `$1`, so a change in the closure's arity becomes a compile error.
- Exception: a short single-parameter closure that uses its parameter once, such as `.map { $0.title }`.

## Error handling

- No force unwraps, `try!` or `as!` without a justifying comment.
- Use `assertionFailure` instead of `fatalError`, log and fall back to a safe value.
- Prevent `try?` that hides an error the caller needs.
- Use typed `throws` where possible.

## Concurrency

- Avoid `@unchecked Sendable` and `nonisolated(unsafe)` unless internal synchronization is in place and documented on the type.

## Testing

- Tests use Swift Testing (`@Test`, `@Suite`), not XCTest.
- Unwrap with `try #require` instead of a force unwrap, so a failure stops only that test.
- Public behavior is covered by tests.
- Prefer a parameterized `@Test(arguments:)` over near-duplicate tests.
- Test own logic, not framework behavior.
