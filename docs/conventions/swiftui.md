# SwiftUI

## View identity

- Branch with `if` or `switch` only to swap out content, such as loading and loaded state.
- Otherwise adjust values to keep the view's state and animations.
- Avoid assigning a `@State` property in `init`, since SwiftUI keeps the first value. Pass the value to the action that needs it, or apply it with `onChange(of:initial:)`.
  - Exception: a parameter that is explicitly only an initial value, named `initial<Name>`. Its doc comment states that it only applies when the view's identity is created.

## View composition

- Prefer storing content built in `init` over a `@ViewBuilder` closure, since SwiftUI cannot compare closures.
  - Keep a closure when there is a reason for it, such as content that takes input or is built later.
- Prefer a separate `View` over a computed property for a self-contained part, so it gets its own invalidation boundary.
- Order `init` parameters by role: displayed values (plain values, `Data` or a model), bindings, initial state (`initialState`), then events (`on...` closures or a `Delegate`).
  - Each role has one direction of data flow, so the call site shows what flows into the view before what flows back out.
  - A `@ViewBuilder` content parameter comes last, so it can be a trailing closure.
  - A synthesized `init` follows the declaration order, so the properties are declared in the same order.

## View modifier

### Inert variant

- Every `ViewModifier` has an inert variant: a neutral value that preserves context rather than overriding it.
- It allows conditional application without breaking view identity, which animations require.
- It is documented and as self-evident as possible.

## Interaction

- Use `Button` for tappable content, not `onTapGesture`, so button semantics reach accessibility.

## Layout

- Read geometry with `onGeometryChange`, not `GeometryReader` with a `PreferenceKey`.
- A reusable view adds no spacing around itself. The view that places it decides the spacing.
  - Padding inside the view's own background is part of its content.

## Previews

- Every view has previews covering its meaningful visual variants.
  - Prefer covering several variants in one preview, such as items in different states.
