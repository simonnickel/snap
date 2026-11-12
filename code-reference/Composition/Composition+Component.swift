import SwiftUI

extension Composition {

    /// A component combines views into a reusable unit and connects them to the values and events of its caller.
    ///
    /// Its `init` takes one parameter group per role, each with one direction of data flow:
    /// - `Data` holds read-only content the caller provides.
    /// - A model, such as an item, arrives as is. The component binds to its properties with `@Bindable` and hands each view a binding to the value it edits.
    /// - Values the caller owns arrive as bindings the component can change, such as whether it is collapsed. Being collapsed is owned by the caller, so it survives the component being recreated and the caller can control it.
    /// - `State` holds UI state no caller needs to control, such as a confirmation in progress. The caller only sets its initial value, and it is lost when the component's identity changes.
    /// - `Delegate` reports events that need the caller, such as a request to delete, through `on...` closures.
    public struct Component: View {

        /// - Parameter initialState: Only applied when the view first appears. Change the view's identity, such as with `id(_:)`, to reset it.
        public init(
            data: Data,
            item: DataSource.Item,
            isCollapsed: Binding<Bool>,
            initialState: State = .init(),
            delegate: Delegate,
        ) {
            self.data = data
            self.item = item
            self._isCollapsed = isCollapsed
            self.state = initialState
            self.delegate = delegate
        }

        private let data: Data

        @Bindable private var item: DataSource.Item

        @Binding private var isCollapsed: Bool

        @State private var state: State

        private let delegate: Delegate

        public var body: some View {
            VStack(alignment: .leading) {
                header
                if !isCollapsed {
                    details
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            // Follows the same binding as the background of `BindingView`, so a change shows at both levels at once.
            .background(item.isEnabled ? Color.accentColor.opacity(0.15) : Color.secondary.opacity(0.15), in: .rect(cornerRadius: 12))
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

        @ViewBuilder private var details: some View {
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
        public struct Data {

            let position: Int
            let count: Int

            public init(
                position: Int,
                count: Int,
            ) {
                self.position = position
                self.count = count
            }

        }


        // MARK: - State

        /// `State` holds UI state the component owns. The caller only sets its initial value.
        ///
        /// Only for state no caller needs to control. State that has to outlive the component or be controlled from outside belongs to the caller, as ``Screen`` shows.
        public struct State {

            var isConfirmingDelete: Bool

            public init(
                isConfirmingDelete: Bool = false,
            ) {
                self.isConfirmingDelete = isConfirmingDelete
            }

        }


        // MARK: - Delegate

        /// `Delegate` holds the events the component reports. The caller implements them and decides how to react.
        ///
        /// Groups the events into one parameter, so adding an event keeps the call sites' shape. A view with a single event can take a plain `on...` closure instead, as ``EventView`` shows.
        public struct Delegate {

            let onDelete: () -> Void

            public init(
                onDelete: @escaping () -> Void,
            ) {
                self.onDelete = onDelete
            }

        }
    }

}


// MARK: - Previews

#Preview("Default") {
    @Previewable @State var item: Composition.DataSource.Item = .mock()
    @Previewable @State var isCollapsed: Bool = false

    Composition.Component(
        data: .init(position: 1, count: 3),
        item: item,
        isCollapsed: $isCollapsed,
        delegate: .init(onDelete: {}),
    )
}

#Preview("Enabled") {
    @Previewable @State var item: Composition.DataSource.Item = .mock(isEnabled: true)
    @Previewable @State var isCollapsed: Bool = false

    Composition.Component(
        data: .init(position: 1, count: 3),
        item: item,
        isCollapsed: $isCollapsed,
        delegate: .init(onDelete: {}),
    )
}

#Preview("Collapsed") {
    @Previewable @State var item: Composition.DataSource.Item = .mock()
    @Previewable @State var isCollapsed: Bool = true

    Composition.Component(
        data: .init(position: 1, count: 3),
        item: item,
        isCollapsed: $isCollapsed,
        delegate: .init(onDelete: {}),
    )
}

#Preview("Confirm delete") {
    @Previewable @State var item: Composition.DataSource.Item = .mock()
    @Previewable @State var isCollapsed: Bool = false

    Composition.Component(
        data: .init(position: 1, count: 3),
        item: item,
        isCollapsed: $isCollapsed,
        initialState: .init(isConfirmingDelete: true),
        delegate: .init(onDelete: {}),
    )
}
