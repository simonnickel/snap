# View Composition

How a SwiftUI view hierarchy is composed: its view types, which state each layer owns and how state travels between them.

## View types

A view's type suffix names its layer or usage.

### Layers

Layers are ordered: flow, screen, component, presentational view.
A view creates only views of a lower layer, except for components and presentational views, which can also nest.

**<xyz>Flow**
- A structurally independent section of the app.
- Handles the navigation between its screens.
- Owns the chrome that applies to the whole flow.

**<xyz>Screen**
- Fills the screen and owns its layout.
- Connects its components and views to business logic and coordinates their interactions.
- Owns the chrome specific to the screen.

**<xyz>Component**
- Connects its views to business logic and coordinates their interactions.

**<xyz>View**
- A presentational view that handles styling and layout, without business logic.

### Usage suffixes

A component or presentational view can be named by its usage instead of its layer, such as `ItemCell` instead of `ItemView`.

**<xyz>Row, Cell**
- A view intended for use in a list or grid.

**<xyz>Header, Footer**
- A view intended for use above or below a section or screen.

**<xyz>Container**
- Wraps content it receives through a `@ViewBuilder` parameter, without knowing the content.
- As a presentational view, adds styling and layout.
- As a component, adds generic behavior, such as routing data to its content.

### Nested types

Each is a struct nested in the view it belongs to.

**Data**
- Groups values the caller provides that the view cannot derive itself.
- Used when no existing type, such as a model, represents those values.
- A view with a single value can take a plain parameter instead.
- Shadowing Foundation's `Data` is accepted, since a view rarely needs raw bytes.

**State**
- Holds the UI state the view owns.
- Shadowing SwiftUI's `State` is accepted, since `@State` still resolves to the property wrapper.

**Delegate**
- Defines the events the view reports as `on...` closures, provided by the parent.
- Groups the events into one parameter, so adding an event keeps the shape of each call site.
- A view with a single event can take a plain `on...` closure instead.
- A standalone `<xyz>Delegate` protocol is an alternative when the parent handles the events in a type.

## State ownership

Each piece of state lives with the layer that needs it the longest:

- Model data lives in a data source, the single source of truth. It is injected from outside the view hierarchy, such as from a dependency container, so no view owns it.
- Navigation state lives in the flow.
- UI state that concerns several components or views, or has to outlive them, lives in the screen.
- UI state no one else needs lives in the component that shows it, such as a confirmation in progress.
- Visual state that only affects how a presentational view looks, such as a hover highlight, lives in that view.

## Passing state down

A view below the owner receives state explicitly in one of three ways:

- The model, when the view binds to its properties with `@Bindable`.
- A binding, when the change is a direct edit the owner accepts as is.
- A value with an `on...` closure, when the owner decides how to react.

Values and closures take the place of a view model, so no view knows where its data lives.
A presentational view receives values ready to show, not the context they are derived from, so it stays reusable.

The environment or a dependency container gives implicit access instead. Use it for what applies to a whole subtree, such as a data source, `dismiss` or styling.

## Initializers

- Order `init` parameters by role: displayed values (plain values, `Data` or a model), bindings, then events (`on...` closures or a `Delegate`), so the call site reads from what flows in to what flows back out.
  - A `@ViewBuilder` content parameter comes last, so it can be a trailing closure.
  - A synthesized `init` follows the declaration order, so the properties are declared in the same order.
