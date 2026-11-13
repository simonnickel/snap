import SwiftUI

/// A component combines views into a reusable unit and connects them to the values and events of its caller.
///
/// Its `init` takes one parameter group per role, each with one direction of data flow:
/// - `Data` holds read-only content the caller provides.
/// - A model, such as an item, arrives as is. The component binds to its properties with `@Bindable` and hands each view a binding to the value it edits.
/// - Values the caller owns arrive as bindings the component can change, such as whether it is collapsed. Being collapsed is owned by the caller, so it survives the component being recreated and the caller can control it.
/// - `State` holds UI state no caller needs to control, such as a confirmation in progress. It is lost when the component's identity changes.
/// - `Delegate` reports events that need the caller, such as a request to delete, through `on...` closures.
struct Component: View {

    let data: Data

    @Bindable var item: DataSource.Item

    @Binding var isCollapsed: Bool

    let delegate: Delegate

    @State private var state = State()

    var body: some View {
        VStack(alignment: .leading) {
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        // Follows the same binding as the background of `BindingView`, so a change shows at both levels at once.
        .background(item.isEnabled ? Color.accentColor.opacity(0.15) : Color.secondary.opacity(0.15), in: .rect(cornerRadius: 12))
    }
    
    
    // MARK: - Content
    
    @ViewBuilder
    private var content: some View {
        header
        if !isCollapsed {
            details
        }
    }

    // The parts read the component's bindings, state and delegate, so they stay properties instead of separate views.
    private var header: some View {
        EventView(
            title: item.title,
            isCollapsed: isCollapsed,
        ) {
            withAnimation {
                isCollapsed.toggle()
            }
        }
    }

    @ViewBuilder
    private var details: some View {
        Text("\(data.position) of \(data.count)")
        BindingView(title: item.title, isOn: $item.isEnabled)
        deleteButton
    }

    private var deleteButton: some View {
        Button("Delete") {
            state.isConfirmingDelete = true
        }
        .confirmationDialog(
            "Delete \(item.title)?",
            isPresented: $state.isConfirmingDelete,
            titleVisibility: .visible,
        ) {
            Button("Delete", role: .destructive, action: delegate.onDelete)
        }
    }


    // MARK: - Data

    /// `Data` holds content the caller provides because the component cannot derive it, such as its position in a list. The component only reads it.
    struct Data {

        let position: Int
        let count: Int

    }


    // MARK: - State

    /// `State` holds UI state the component owns.
    ///
    /// Only for state no caller needs to control. State that has to outlive the component or be controlled from outside belongs to the caller, as ``Screen`` shows.
    struct State {

        var isConfirmingDelete: Bool = false

    }


    // MARK: - Delegate

    /// `Delegate` holds the events the component reports. The caller provides them and decides how to react.
    ///
    /// Groups the events into one parameter, so adding an event keeps the call sites' shape. A view with a single event can take a plain `on...` closure instead, as ``EventView`` shows.
    struct Delegate {

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
#endif

#Preview {
    VStack {
        Component(
            data: .init(position: 1, count: 4),
            item: .mock(),
            isCollapsed: .constant(false),
            delegate: .init(onDelete: {}),
        )

        Component(
            data: .init(position: 2, count: 4),
            item: .mock(isEnabled: true),
            isCollapsed: .constant(false),
            delegate: .init(onDelete: {}),
        )

        Component(
            data: .init(position: 3, count: 4),
            item: .mock(),
            isCollapsed: .constant(true),
            delegate: .init(onDelete: {}),
        )

        Component(
            data: .init(position: 4, count: 4),
            item: .mock(),
            isCollapsed: .constant(false),
            delegate: .init(onDelete: {}),
        )
        .previewState(.init(isConfirmingDelete: true))
    }
    .padding()
}
