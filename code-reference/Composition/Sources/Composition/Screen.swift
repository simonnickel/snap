import SwiftUI

/// A screen connects a ``DataSource`` to its components and coordinates their interactions.
///
/// It hands each component its model and handles the events that need the data source.
/// It owns the UI state that concerns several components or has to outlive them, such as which items are collapsed, so it can collapse all of them at once.
///
/// It owns the chrome that configures it, such as its title and toolbar.
struct Screen: View {

    let data: Data

    let dataSource: DataSource

    @State private var state = State()


    // MARK: - Body

    var body: some View {
        ScrollView {
            content
        }
        .navigationTitle(data.title)
        .toolbar {
            toolbar
        }
    }


    // MARK: Content

    private var content: some View {
        VStack {
            ForEach(Array(dataSource.items.enumerated()), id: \.element.id) { index, item in
                row(for: item, position: index + 1)
            }
        }
        .padding()
    }

    private func row(for item: DataSource.Item, position: Int) -> some View {
        Component(
            data: .init(
                position: position,
                count: dataSource.items.count,
            ),
            item: item,
            // Hand-built, since the binding is derived from a set and `$state` cannot express it.
            isCollapsed: Binding(
                get: { state.collapsedIDs.contains(item.id) },
                set: { isCollapsed in
                    if isCollapsed {
                        state.collapsedIDs.insert(item.id)
                    } else {
                        state.collapsedIDs.remove(item.id)
                    }
                },
            ),
            delegate: .init(
                onMoveUp: {
                    dataSource.moveItem(id: item.id, by: -1)
                },
                onMoveDown: {
                    dataSource.moveItem(id: item.id, by: 1)
                },
                onDelete: {
                    dataSource.removeItem(id: item.id)
                    // Otherwise "Expand All" stays enabled for a removed item.
                    state.collapsedIDs.remove(item.id)
                },
            ),
        )
    }


    // MARK: Toolbar

    private var toolbar: some ToolbarContent {
        ToolbarItemGroup {
            Group {
                Button("Add", systemImage: "plus") {
                    dataSource.addItem()
                }

                Button("Collapse All", systemImage: "rectangle.compress.vertical") {
                    state.collapsedIDs = Set(dataSource.items.map(\.id))
                }
                .disabled(dataSource.items.allSatisfy { state.collapsedIDs.contains($0.id) })

                Button("Expand All", systemImage: "rectangle.expand.vertical") {
                    state.collapsedIDs = []
                }
                .disabled(state.collapsedIDs.isEmpty)
            }
            .labelStyle(.iconOnly)
        }
    }


    // MARK: - Data

    /// `Data` groups values the caller provides.
    struct Data {

        let title: String

    }


    // MARK: - State

    /// `State` holds UI state the screen owns.
    struct State {

        var collapsedIDs: Set<DataSource.Item.ID> = []

    }
}


// MARK: - Previews

#if DEBUG
extension Screen {
    /// Sets the initial value of `state`, so a preview can show a state the view only reaches through interaction.
    func previewState(_ state: State) -> Self {
        var view = self
        view._state = SwiftUI.State(initialValue: state)
        return view
    }
}
#endif

#Preview {
    @Previewable @State var dataSource: DataSource = .init(items: [.mock(), .mock(isEnabled: true), .mock()])

    NavigationStack {
        Screen(
            data: .init(
                title: "Title",
            ),
            dataSource: dataSource,
        )
        .previewState(.init(collapsedIDs: Set(dataSource.items.suffix(1).map(\.id))))
    }
}
