# Composition

An example of composing a screen from components and presentational views. It applies the layers, state ownership and state passing described in [`view-composition.md`](../../docs/conventions/view-composition.md).

## Layers

- `Flow` owns the navigation path and shows the screen in a navigation stack.
- `Screen` owns which items are collapsed, so it can collapse all of them at once.
- `Component` owns the delete confirmation and reports the deletion through its `Delegate`.
- Presentational views, each showing one way to receive state:
  - `BindingView` edits a value it receives as a binding.
  - `EventView` reports an interaction through an `on...` closure.

## Data

`DataSource` stands in for any source of external data, such as a database or a network service. It owns the items and is injected from outside the view hierarchy.

## Naming

Types are named after their role, not their content, so the example applies to any feature.
