# Principles

Making decisions is hard. Sometimes it helps to take a look at what you actually want to achieve. Some principles I try to follow:

 - Keep it simple: Least complex solution is preferred.
 - Choose vanilla: Stay close to the system, prevent pattern/architecture/framework.
 - Locality, Separation, Independence, Black Box: Prevent dependencies between modules / features / sections.  
 - Maintainability: Prevent future work.
 - Don't let it dry out: While DRY (don't repeat yourself) is great, it's often misunderstood as don't repeat code. It should be don't repeat logic instead.
 - Explicit over implicit. Don't hide the details.


## Dependencies
Trying to prevent using external dependencies. This is a guideline, not a rule. The closer to the core, the more significant it becomes.

1. Try a simpler solution that works out of the box.
2. If worth it, try to reimplement. Book the effort as learning.
3. If using something external, try to wrap it for easy replacement.


# Style Guide

I like rules, but not to enforce them. So I am not using any formatter or linter. Just some conventions I got used to.


## Code Structure
On file level, Code is structured to easily find stuff using the minimap. Using `// MARK: - XYZ`.

On block level, Code is structured like a text. Related lines of code are together and separated to other blocks by an empty line. 

Use empty lines to structure the file visually.


## Multi-line indentation
Use Xcode default formatting with `control + m`.


## Comments
`// TODO:` indicates where something has to be done next. 

 - Use on a branch to indicate ongoing development.
 - Never merge to main.

`// TODO <xyz>:` indicates an optional improvement for the future. Common tags:

 - `FB#`: A workaround because something does not work as expected, reference related FB number. Fix when FB is resolved.
 - `finetuning`: A non critical improvement is possible.
 - `idea`: A new feature might evolve here.


# SwiftUI

## View Modifier
Every ViewModifier should have a neutral value. It should be possible to conditionally apply a value while keeping the hierarchical identity,
The neutral value should be obvious, at least documented.


# Naming conventions

## Views
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
