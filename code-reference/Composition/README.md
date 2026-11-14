# Composition

An example of composing a screen from components and views, showing which layer owns which state and how it travels between them.

## State ownership

Each piece of state lives with the layer that needs it the longest:

- Model data lives in a data source, the single source of truth. It is injected from outside the view hierarchy, such as from a dependency container, so no view owns it.
- Navigation state lives in the flow.
- UI state that concerns several elements or has to outlive them lives in the screen.
- UI state no one else needs lives in the component that shows it, such as a confirmation in progress.
- Visual state that only affects how a presentational view looks, such as a hover highlight, lives in that view.

## Passing state down

A view below the owner receives state in one of three ways:

- The model, when the view binds to its properties with `@Bindable`.
- A binding, when the change is a direct edit the owner accepts as is.
- A value with an `on...` closure, when the owner decides how to react.

## View initializers

Each view's `init` groups its parameters by role, in a fixed order: displayed values, bindings, events.

- A view takes a nested `Data` only when no existing type represents its content.
- A nested `Delegate` bundles its events.
- Values and closures take the place of a view model, so no view knows where its data lives.

## Spacing

A view adds no spacing around itself. The view that places it decides the spacing. Padding inside a view's own background is part of the view.

## Naming

Types are named after their role, not their content, so the example applies to any feature.
