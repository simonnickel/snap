# SwiftUI

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
