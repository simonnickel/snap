# API Design

Applies to any public API: a package, a module or a type consumed elsewhere.

- Public API should be intuitive and hard to misuse. Prefer designs that make wrong usage a compile error over ones that fail at runtime.
- Avoid internal assumptions about the consumer's architecture, threading model or lifecycle.
- Prefer designing for how an API could be used over how it currently is used.
