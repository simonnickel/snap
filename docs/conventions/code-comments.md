# Code Comments

Comments are for developers exploring the code, not a changelog.

## When to write

Write a comment when it explains something the code cannot show:

- Why a design was chosen over alternatives
- Non-obvious constraints or invariants
- How to use a public declaration whose purpose is not obvious from its name

Don't write a comment that describes what the code does. Naming should do that.

## Content

- A comment is as short as the idea it carries.
- Parameters, return values and claims in a doc comment match the declaration.
- A comment does not reference the task, fix or PR that introduced it.
- A comment makes no specific claims about the current structure of a type, such as the number of cases or variants. They become wrong as the type evolves.

## TODO

`// TODO:` indicates where something has to be done next.

- Use on a branch to indicate ongoing development.
- Never merge to main.

`// TODO-<n>:` marks a place an item of the project-level TODO list relates to. `<n>` is the item's id.

## Workarounds

A workaround for something that does not work as expected starts with `// Workaround`. It states the affected OS versions and, if filed, the Apple Feedback number, such as `// Workaround for FB12345678 (iOS 18): …`.
