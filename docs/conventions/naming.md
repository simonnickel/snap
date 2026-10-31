# Naming

Follow the [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/).

- Avoid names that collide with SwiftUI types, such as `Label` or `Section`.
- Name event handler closures `on...`, matching SwiftUI modifiers such as `onAppear`.
  - Name what happened in the view, such as `onTapClose`, not what the parent should do, such as `onShouldDismiss`.

## Service layer types

The suffixes overlap, but each one communicates a different expectation.

**<xyz>Service**
Provides _stateless_ functionality to be accessed when needed.

**<xyz>Manager**
Takes care of a more complex and _stateful_ topic, needs to be set up and kept alive.

**<xyz>DataSource**
Source of information to read and write.

**<xyz>Provider**
Read-only source of information to be consumed.


## View Naming

**<xyz>Flow**
A structurally independent section of the app.
Usually owns a NavigationStack to show a series of Screens.
Owns navigation chrome, such as a button that dismisses the flow.

**<xyz>Screen**
An arrangement of views filling the screen, displayed within a `Flow`. Owns the overall layout, manages data flow to its elements and coordinates interactions between them.
Owns the chrome that configures the screen, such as title, toolbar and background.

**<xyz>Component**
A reusable view that presents or interacts with business logic: calling services, handling actions or managing state.

**<xyz>View**
A reusable view focused on styling and layout, with no business logic.

**<xyz>Row, Cell**
A view intended for use in a list or grid. Can be a Component or View depending on whether it connects to business logic.

**<xyz>Container**
A view wrapping other content via a ViewBuilder parameter.


## View Related Types

**<xyz>State**
A struct that represents a snapshot of changeable state for a Flow or Screen.

**<xyz>Data**
A struct that represents some content to be displayed by a Screen or View. Used instead of Model or ViewModel.

**<xyz>Delegate**
A protocol or struct defining actions a view can trigger. Implemented by the parent to handle behavior without the view depending on it.
