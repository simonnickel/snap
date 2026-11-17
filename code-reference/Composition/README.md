# Composition

An example of the view composition described in [`view-composition.md`](../../docs/conventions/view-composition.md). Each type's doc comment explains its part.

It shows the general concepts and the options between them. It does not cover how to build a specific feature.

## Types

Types are named after their role, not their content, so the example applies to any feature.

- `BindingView` and `EventView` are presentational views.
- `Container` is a presentational container.
- `DataSource` stands in for any source of model data.

## Where to look

- **Ownership:** model data in `DataSource`, navigation in `Flow`, shared UI state in `Screen`, local UI state in `Component`.
- **Passing down:** a binding in `BindingView`, `on...` closures in `EventView`, the model in `Component`.
- **Nested types:** `Data` in `Component`, `State` in `Screen` and `Component`, `Delegate` in `Component` and `EventView`.

## Options shown

- A flow passes the data source to its screen, or the screen resolves it itself, as `Flow` describes.
- A view that edits one value takes a binding to that value instead of the model, as `BindingView` shows.
- A view with a single value takes a plain parameter instead of `Data`, as `Screen` shows.
- A part of a view stays a property instead of a separate view when it reads the view's bindings, state and delegate, as `Component` shows.

## Not shown

- **Sheets:** A sheet is a screen, so it follows the same rules as any other screen.
- **Local state:** A screen that edits a draft, such as a form in a sheet, keeps the draft as its own state until it saves it to the data source.
- **Environment:** Apart from resolving the data source, as `Flow` describes, the example passes all state explicitly. Context for a whole subtree, such as `dismiss` or styling, comes from the environment.
- **Loading state:** Switching between loading, loaded and failed content is not covered by the example.
- **Navigation:** How a screen requests navigation and how destinations are presented is covered by [snap-navigation](https://github.com/simonnickel/snap-navigation).
