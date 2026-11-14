# Naming

Follow the [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/).

- Avoid names that collide with SwiftUI types, such as `Label` or `Section`.
  - Exception: the nested `State` described under view-related types.
- Name event handler closures `on...`, matching SwiftUI modifiers such as `onAppear`.
  - Name what happened in the view, such as `onClose`, not what the parent should do, such as `onShouldDismiss`.
  - Leave out the input method, such as `Tap`, since the same event can come from a tap, a keyboard or an assistive technology.

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


## View naming

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
A presentational view: reusable, focused on styling and layout, with no business logic.
In prose, "presentational view" refers to this tier and "view" to any SwiftUI `View`.

**<xyz>Row, Cell**
A view intended for use in a list or grid. Can be a Component or View depending on whether it connects to business logic.

**<xyz>Container**
A view wrapping other content via a ViewBuilder parameter.


## View-related types

**State**
A struct nested in a view that represents a snapshot of its changeable state. Shadowing SwiftUI's `State` is accepted, since `@State` still resolves to the property wrapper.

**Data**
A struct nested in a view that represents the content it displays. Used instead of Model or ViewModel. Shadowing Foundation's `Data` is accepted, since a view rarely needs raw bytes.
Only used when no existing type represents that content. A view that displays or binds a model as a whole takes the model directly.

**Delegate**
A struct nested in a view that defines the events it reports as `on...` closures. Provided by the parent to handle behavior without the view depending on it.
A standalone `<xyz>Delegate` protocol is an alternative when the parent handles the events in a type.
