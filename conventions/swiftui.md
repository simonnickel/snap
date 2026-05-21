# SwiftUI

## View Modifier
Every ViewModifier should have an inert variant (a neutral value, that preserves the context instead of setting a new value). It should be possible to conditionally apply a value while keeping the identity, to allow animations.
The inert variant should be documented and as obvious as possible.


## View Naming

**<xyz>Scene** -
A structural independent section of the app. 
Usually the entry into a set of screens that can be displayed in a NavigationStack.
(E.g. ListLoopScene that will present ListScreen.)

**<xyz>Screen** -
An independent arrangement of Views that is displayed in a `Scene`.
(E.g. ListScreen that is presented in a ListLoopScene.)

**<xyz>View, Row, Section, ...** -
Building blocks to layout into a Screen.

**<xyz>Container** -
A generic View to place another View into.