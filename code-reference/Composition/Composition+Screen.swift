import SwiftUI

extension Composition {

    /// A screen connects a ``DataSource`` to its elements and coordinates their interactions.
    ///
    /// It hands each element a binding into the data source and handles the events that need the data source, such as deleting an item.
    /// It owns the UI state that concerns several elements or has to outlive them, such as which items are collapsed, so it can collapse all of them at once.
    public struct Screen: View {

        /// - Parameter initialState: Only applied when the view's identity is created. Change the identity, such as with `id(_:)`, to reset it.
        public init(
            data: Data,
            dataSource: DataSource,
            initialState: State = .init(),
        ) {
            self.data = data
            self.dataSource = dataSource
            self.state = initialState
        }

        private let data: Data

        private let dataSource: DataSource

        @State private var state: State
        
        
        // MARK: - Body

        public var body: some View {
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
            let id = item.id

            return Component(
                data: .init(
                    position: position,
                    count: dataSource.items.count,
                ),
                item: item,
                // Hand-built, since the binding is derived from a set and `$state` cannot express it.
                isCollapsed: Binding(
                    get: { state.collapsedIDs.contains(id) },
                    set: { isCollapsed in
                        if isCollapsed {
                            state.collapsedIDs.insert(id)
                        } else {
                            state.collapsedIDs.remove(id)
                        }
                    },
                ),
                delegate: .init(
                    onDelete: {
                        dataSource.removeItem(id: id)
                        // Keeps collapsedIDs free of the ids of removed items.
                        state.collapsedIDs.remove(id)
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

        /// `Data` holds content the caller provides. The screen only reads it.
        public struct Data {

            let title: String

            public init(
                title: String,
            ) {
                self.title = title
            }

        }


        // MARK: - State

        /// `State` holds UI state the screen owns. The caller only sets its initial value.
        public struct State {

            var collapsedIDs: Set<DataSource.Item.ID>

            public init(
                collapsedIDs: Set<DataSource.Item.ID> = [],
            ) {
                self.collapsedIDs = collapsedIDs
            }

        }
    }

}


// MARK: - Previews

#Preview {
    @Previewable @State var dataSource: Composition.DataSource = .init(items: [.mock(), .mock(isEnabled: true), .mock()])

    NavigationStack {
        Composition.Screen(
            data: .init(
                title: "Title",
            ),
            dataSource: dataSource,
            initialState: .init(collapsedIDs: Set(dataSource.items.suffix(1).map(\.id))),
        )
    }
}
