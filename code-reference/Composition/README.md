# Composition

An example of composing SwiftUI views into layers that each own their state. It applies the layers, state ownership and state passing described in [`view-composition.md`](../../docs/conventions/view-composition.md).

It shows the general concepts and the options between them. It does not cover how to build a specific feature.

## Layers

- `Flow` owns the navigation and shows its screen in a navigation stack.
- `Screen` connects the data source to its components and owns the UI state they share.
- `Component` connects presentational views to the model and decides how to react to their events.
- `BindingView` and `EventView` are presentational views. They show values and report changes, without knowing the model.
- `DataSource` stands in for any source of model data. It is injected from outside the view hierarchy.

## State ownership

- The items live in `DataSource`, the single source of truth.
- The navigation path lives in `Flow`.
- Which items are collapsed lives in `Screen`, so it can collapse all of them at once.
- A delete confirmation in progress lives in `Component`, since no one else needs it.

## Passing state down

- `Component` receives the model and binds to its properties with `@Bindable`.
- `BindingView` receives a binding, since the owner accepts each edit as is.
- `EventView` receives values and reports interactions through `on...` closures, since moving and deleting change the collection and the owner decides how to react.

## Nested types

- `Data` holds content the caller provides, as `Screen` and `Component` show.
- `State` holds UI state the view owns, as `Screen` and `Component` show.
- `Delegate` groups the events a view reports, as `Component` and `EventView` show.

## Options shown

- A flow passes the data source to its screen, or the screen resolves it itself, as `Flow` describes.
- A view that edits one value takes a binding to that value instead of the model, as `BindingView` shows.
- A view groups its events in a `Delegate`, or takes a plain `on...` closure for a single event, as `Component.Delegate` describes.
- A part of a view stays a property instead of a separate view when it reads the view's bindings, state and delegate, as `Component` shows.

## Naming

Types are named after their role, not their content, so the example applies to any feature.
