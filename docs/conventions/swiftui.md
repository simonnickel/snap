# SwiftUI

## View identity

- Branch with `if` or `switch` only to swap out content, such as loading and loaded state.
- Otherwise adjust values to keep the view's state and animations.
- Prevent using `State(initialValue: value)` in `init`, since SwiftUI keeps the first value. Pass the value to the action that needs it, or apply it with `onChange(of:initial:)`.

## View composition

- Prefer storing content built in `init` over a `@ViewBuilder` closure, since SwiftUI cannot compare closures.
  - Keep a closure when there is a reason for it, such as content that takes input or is built later.
- Prefer a separate `View` over a computed property for a self-contained part, so it gets its own invalidation boundary.

## View Modifier

### Inert variant

- Every `ViewModifier` has an inert variant: a neutral value that preserves context rather than overriding it.
- It allows conditional application without breaking view identity, which animations require.
- It is documented and as self-evident as possible.

## Interaction

- Use `Button` for tappable content, not `onTapGesture`, so button semantics reach accessibility.

## Layout

- Read geometry with `onGeometryChange`, not `GeometryReader` with a `PreferenceKey`.

## Previews

- Every view has previews covering its meaningful visual variants.
