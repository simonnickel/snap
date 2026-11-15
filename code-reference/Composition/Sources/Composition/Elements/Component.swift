import SwiftUI

/// A component is a reusable view that connects presentational views to business logic.
///
/// It knows the model it shows and handles interactions, such as confirming a delete before reporting it. A presentational view knows neither, as ``BindingView`` and ``EventView`` show.
///
/// Its `init` takes one parameter group per role, each with one direction of data flow:
/// - `Data` holds read-only content the caller provides.
/// - A model, such as an item, arrives as is. The component binds to its properties with `@Bindable` and hands each view the values it shows and a binding to the value it edits.
/// - Values the caller owns arrive as bindings the component can change, such as whether it is collapsed. Being collapsed is owned by the caller, so it survives the component being recreated and the caller can control it.
/// - `Delegate` reports events that need the caller, such as moving or deleting the item, through `on...` closures.
struct Component: View {

    let data: Data

    @Bindable var item: DataSource.Item

    @Binding var isCollapsed: Bool

    let delegate: Delegate

    @State private var state = State()


    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        // Reads the value `BindingView` edits through its binding, so a change shows at both levels at once.
        .background(item.isEnabled ? Color.accentColor.opacity(0.15) : Color.secondary.opacity(0.15), in: .rect(cornerRadius: 12))
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

    /// `Data` holds content the caller provides because the component cannot derive it, such as its position in a list. The component only reads it and turns it into the values its views show, so they stay unaware of the list.
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

    /// `Delegate` holds the events the component reports. The caller provides them and decides how to react.
    ///
    /// Groups the events into one parameter, so adding an event keeps the call sites' shape. A view with a single event can take a plain `on...` closure instead.
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
