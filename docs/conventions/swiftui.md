# SwiftUI

## View identity

- Branch with `if` or `switch` only to swap out content, such as loading and loaded state.
- Otherwise adjust values to keep the view's state and animations.
- Avoid assigning a `@State` property in `init`, since SwiftUI keeps the first value. Pass the value to the action that needs it, or apply it with `onChange(of:initial:)`.
  - Exception: a `previewState(_:)` method in a `#if DEBUG` extension, so a preview can show a state the view only reaches through interaction.

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
