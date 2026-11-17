# Composition

An example of composing SwiftUI views into layers that each own their state. It applies the layers, state ownership and state passing described in [`view-composition.md`](../../docs/conventions/view-composition.md).

It shows the general concepts and the options between them. It does not cover how to build a specific feature.

## Types

- `Flow` owns the navigation and shows its screen in a navigation stack.
- `Screen` connects the data source to its components and owns the UI state they share.
- `Component` connects presentational views to the model and decides how to react to their events.
- `BindingView` and `EventView` are presentational views. They show values and report changes, without knowing the model.
- `Container` wraps any content with layout and styling, without knowing the content.
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

- `Data` groups values the caller provides, as `Component` shows.
- `State` holds UI state the view owns, as `Screen` and `Component` show.
- `Delegate` groups the events a view reports, as `Component` and `EventView` show.

## Options shown

- A flow passes the data source to its screen, or the screen resolves it itself, as `Flow` describes.
- A view that edits one value takes a binding to that value instead of the model, as `BindingView` shows.
- A view with a single value takes a plain parameter instead of `Data`, as `Screen` shows.
- A part of a view stays a property instead of a separate view when it reads the view's bindings, state and delegate, as `Component` shows.

## Not shown

- **Sheets:** A sheet is a screen, so it follows the same rules as any other screen.
- **Local state:** A screen that edits a draft, such as a form in a sheet, keeps the draft as its own state until it saves it to the data source.
- **Environment:** Apart from resolving the data source, as `Flow` describes, the example passes all state explicitly. Context for a whole subtree, such as `dismiss` or styling, comes from the environment.
- **Loading state:** Switching between loading, loaded and failed content is not covered by the example.
- **Navigation:** The flow owns the navigation state. How a screen requests navigation and how destinations are presented is covered by [snap-navigation](https://github.com/simonnickel/snap-navigation).

## Naming

Types are named after their role, not their content, so the example applies to any feature.
