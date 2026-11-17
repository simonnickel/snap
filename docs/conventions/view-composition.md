# View Composition

How a SwiftUI view hierarchy is composed: its layers, which state each layer owns and how state travels between them. A view's type suffix names its layer or shape.

## Layers

**<xyz>Flow**
A structurally independent section of the app.
Shows a series of screens, such as in a `NavigationStack`.
Owns the chrome that applies to the whole flow, such as a button that dismisses it.

**<xyz>Screen**
An arrangement of views filling the screen, displayed within a flow.
Owns the overall layout, manages data flow to its components and views and coordinates interactions between them.
Owns the chrome specific to the screen, such as its title and toolbar items.

**<xyz>Component**
A reusable view that presents or interacts with business logic, such as calling services or handling actions.

**<xyz>View**
A presentational view: reusable, focused on styling and layout, with no business logic.
In prose, "presentational view" refers to this layer and "view" to any SwiftUI `View`.

## Shapes

A shape names how a view is used. It is a component or a presentational view, depending on whether it connects to business logic.

**<xyz>Row, Cell**
A view intended for use in a list or grid.

**<xyz>Container**
A view wrapping content it receives through a `@ViewBuilder` parameter, without knowing the content.
As a presentational view, it adds layout and styling. As a component, it adds generic behavior, such as routing data to its content.

## Containment

A view creates only views of a lower layer, in the order flow, screen, component, presentational view.
Components and presentational views can also create views of their own layer.

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

## Nested types

**State**
A struct nested in a view that represents a snapshot of its changeable state. Shadowing SwiftUI's `State` is accepted, since `@State` still resolves to the property wrapper.

**Data**
A struct nested in a view that groups values the caller provides, since the view cannot derive them itself. Shadowing Foundation's `Data` is accepted, since a view rarely needs raw bytes.
Only used when no existing type represents those values. A view that displays or binds a model as a whole takes the model directly.

**Delegate**
A struct nested in a view that defines the events it reports as `on...` closures. Provided by the parent to handle behavior without the view depending on it.
Groups the events into one parameter, so adding an event keeps the shape of each call site. A view with a single event can take a plain `on...` closure instead.
A standalone `<xyz>Delegate` protocol is an alternative when the parent handles the events in a type.
