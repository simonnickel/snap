# Code Comments

Comments are for developers exploring the code, not a changelog.

## When to write

Write a comment when it helps understand design, usage or intent. That can include:

- Why a design was chosen over alternatives
- Non-obvious constraints or invariants
- Usage guidance for public API

Don't write comments that:

- Describe what the code does (naming should do that)
- Reference the task, fix or PR that introduced them
- Make specific claims about the current structure of a type, such as the number of cases or variants. They become wrong as the type evolves.

## TODO

`// TODO:` indicates where something has to be done next.

- Use on a branch to indicate ongoing development.
- Never merge to main.

`// TODO <xyz>:` indicates an optional improvement for the future. Common tags:

- `FB#`: A workaround because something does not work as expected, reference related FB number. Fix when FB is resolved.
- `finetuning`: A non critical improvement is possible.
- `idea`: A new feature might evolve here.

Don't remove existing TODO/FIXME comments unless explicitly asked to.
