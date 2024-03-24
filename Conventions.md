# Principles

 - Keep it simple: Least complex solution is preferred.
 - Choose vanilla: Stay close to the system, prevent pattern/architecture/framework.
 - Locality, Separation, Independence: Prevent dependencies between modules / features / sections.  
 - Maintainability: Prevent future work.


# Style Guide

## Comments

`// TODO:` indicates where something has to be done next. 

 - Use on a branch to indicate ongoing development.
 - Never merge to main.

`// TODO <xyz>:` indicates an optional improvement for the future. Common tags:

 - `FB#`: A workaround because something does not work as expected, reference related FB number. Fix when FB is resolved.
 - `finetuning`: A non critical improvement is possible.
 - `idea`: A new feature might evolve here.


# Naming conventions

## Views

<xyz>Scene -
A structural independent section of the app. 
Usually the entry into a set of screens that can be displayed in a NavigationStack.
e.g. ListLoopScene that will present ListScreen.

<xyz>Screen -
A layout of Views to be displayed in a Scene.
e.g. ListScreen that is presented in a ListLoopScene. 

<xyz>View, Row, Section, ... -
Building blocks to layout into a Screen.

<xyz>Container -
A generic View to place another View into.


## Data, State, Model

<xyz>State -
A struct that represents the changing state for a Scene or Screen.

<xyz>Data -
A struct with data that does not change. Usually injected into a Screen.
(I prefer Data over Model.)


## Others

<xyz>Manager -

<xyz>Service -

<xyz>Controller -

DataSource, Provider
