# Naming

Follow the [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/).

- Avoid names that collide with SwiftUI types, such as `Label` or `Section`.
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


## View types

A view's type suffix names its layer or shape, and nested types follow a fixed set of names, both described in `view-composition.md`.
