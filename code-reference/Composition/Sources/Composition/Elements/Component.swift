import SwiftUI

/// A component is a reusable view that connects presentational views to business logic.
///
/// It knows the model it shows and handles interactions, such as confirming a delete before reporting it.
struct Component: View {

    let data: Data

    @Bindable var item: DataSource.Item

    @Binding var isCollapsed: Bool

    let delegate: Delegate

    @State private var state = State()


    // MARK: - Body

    var body: some View {
        // Reads the value `BindingView` edits through its binding, so a change shows at both levels at once.
        Container(isHighlighted: item.isEnabled) {
            content
        }
    }


    // MARK: Content

    @ViewBuilder
    private var content: some View {
        header
        if !isCollapsed {
            BindingView(title: item.title, isOn: $item.isEnabled)
            footer
        }
    }

    // The parts read the component's bindings, state and delegate, so they stay properties instead of separate views.
    private var header: some View {
        Button {
            isCollapsed.toggle()
        } label: {
            Label("\(item.title) \(item.id.uuidString.prefix(4))", systemImage: isCollapsed ? "chevron.right" : "chevron.down")
        }
    }

    private var footer: some View {
        EventView(
            title: "\(data.position) of \(data.count)",
            canMoveUp: data.position > 1,
            canMoveDown: data.position < data.count,
            delegate: .init(
                onMoveUp: delegate.onMoveUp,
                onMoveDown: delegate.onMoveDown,
                onDelete: {
                    state.isConfirmingDelete = true
                },
            ),
        )
        .confirmationDialog(
            "Delete \(item.title)?",
            isPresented: $state.isConfirmingDelete,
            titleVisibility: .visible,
        ) {
            Button("Delete", role: .destructive, action: delegate.onDelete)
        }
    }


    // MARK: - Data

    /// `Data` groups values the caller provides because the component cannot derive them, such as its position in a list. The component turns them into what its views show, so they stay unaware of the list.
    struct Data {

        let position: Int
        let count: Int

    }


    // MARK: - State

    /// `State` holds UI state no caller needs to control, such as a confirmation in progress. It is lost when the component's identity changes.
    ///
    /// State that has to outlive the component or be controlled from outside belongs to the caller, as ``Screen`` shows.
    struct State {

        var isConfirmingDelete: Bool = false

    }


    // MARK: - Delegate

    /// `Delegate` holds the events the component reports. The caller decides how to react.
    struct Delegate {

        let onMoveUp: () -> Void
        let onMoveDown: () -> Void
        let onDelete: () -> Void

    }
}


// MARK: - Previews

#if DEBUG
extension Component {
    /// Sets the initial value of `state`, so a preview can show a state the view only reaches through interaction.
    func previewState(_ state: State) -> Self {
        var view = self
        view._state = SwiftUI.State(initialValue: state)
        return view
    }
}

extension Component.Delegate {
    static var preview: Self {
        .init(
            onMoveUp: {},
            onMoveDown: {},
            onDelete: {},
        )
    }
}
#endif

#Preview {
    VStack {
        Component(
            data: .init(position: 1, count: 4),
            item: .mock(),
            isCollapsed: .constant(false),
            delegate: .preview,
        )

        Component(
            data: .init(position: 2, count: 4),
            item: .mock(isEnabled: true),
            isCollapsed: .constant(false),
            delegate: .preview,
        )

        Component(
            data: .init(position: 3, count: 4),
            item: .mock(),
            isCollapsed: .constant(true),
            delegate: .preview,
        )

        Component(
            data: .init(position: 4, count: 4),
            item: .mock(),
            isCollapsed: .constant(false),
            delegate: .preview,
        )
        .previewState(.init(isConfirmingDelete: true))
    }
    .padding()
}
