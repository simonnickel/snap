# SwiftUI

## View Modifier
Every ViewModifier should have an inert variant — a neutral value that preserves context rather than overriding it. This allows conditional application without breaking view identity, which is required for animations. The inert variant should be documented and as self-evident as possible.


## View Naming

**<xyz>Flow** —
A structurally independent section of the app.
Usually owns a NavigationStack to show a series of Screens.

**<xyz>Screen** —
An arrangement of views filling the screen, displayed within a `Flow`. Owns the overall layout, manages data flow to its elements and coordinates interactions between them.

**<xyz>Component** —
A reusable view that presents or interacts with business logic: calling services, handling actions or managing state.

**<xyz>View** —
A reusable view focused on styling and layout, with no business logic.

**<xyz>Row, Cell** —
A view intended for use in a list or grid. Can be a Component or View depending on whether it connects to business logic.

**<xyz>Container** —
A generic view wrapping another view, typically via a ViewBuilder parameter.


## View Data

**<xyz>State** —
A struct that represents a snapshot of changeable state for a Flow or Screen.

**<xyz>Data** —
A struct that represents some content to be displayed by a Screen or View. (I prefer Data over Model or ViewModel.)