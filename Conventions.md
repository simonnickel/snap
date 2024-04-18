# Principles

Making decisions is hard. Sometimes it helps to take a look at what you actually want to achieve. Some principles I try to follow:

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

**<xyz>Scene** -
A structural independent section of the app. 
Usually the entry into a set of screens that can be displayed in a NavigationStack.
e.g. ListLoopScene that will present ListScreen.

**<xyz>Screen** -
A layout of Views to be displayed in a Scene.
e.g. ListScreen that is presented in a ListLoopScene. 

**<xyz>View, Row, Section, ...** -
Building blocks to layout into a Screen.

**<xyz>Container** -
A generic View to place another View into.


## View related structs

**<xyz>State** -
A struct that represents a snapshot of changable state for a Scene or Screen.

**<xyz>Data** -
A struct that represents some content to be displayed by a Screen or View. (I prefer Data over Model or ViewModel.)


## Service layer types

While most of them are basically the same, sometimes nuances make sense to better communicate expections.

**<xyz>Service** - Provides a simple adhoc functionality to be accessed when needed.

**<xyz>Manager** - Takes care of a more complex topic, usually needs to be setup and kept alive.

**<xyz>DataSource** - Source of information to read and write.

**<xyz>Provider** - Read only source of information to be consumed.
