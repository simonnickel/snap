import SwiftUI

/// A flow is a structurally independent section of the app that shows its screens in a navigation stack.
///
/// It owns the navigation state, such as the navigation path and the destinations its screens lead to.
///
/// It passes the ``DataSource`` on to its screen. Alternatively, the screen resolves it itself, such as from a dependency container in the environment.
struct Flow: View {

    let dataSource: DataSource

    @State private var path: [DataSource.Item.ID] = []

    var body: some View {
        NavigationStack(path: $path) {
            Screen(
                data: .init(
                    title: "Title",
                ),
                dataSource: dataSource,
            )
            .navigationDestination(for: DataSource.Item.ID.self) { _ in
                // Placeholder for the screen an item leads to.
                Text("Destination")
            }
        }
    }
}


// MARK: - Previews

#Preview {
    Flow(dataSource: .init(items: [.mock(), .mock(isEnabled: true), .mock()]))
}
