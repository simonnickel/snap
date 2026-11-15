import SwiftUI

/// A view that reports interactions takes the values it shows and an `on...` closure for each interaction, grouped in its `Delegate`.
///
/// It changes nothing itself, so the owner decides how to react, such as asking for confirmation before deleting. Moving or deleting changes a collection, which no binding to a single value can express. When the change is a direct edit of a value, take a binding instead, as ``BindingView`` shows.
///
/// Each closure is named after what happened in the view, such as `onDelete`. See "Naming" in `docs/conventions/naming.md`.
struct EventView: View {

    let title: String
    let canMoveUp: Bool
    let canMoveDown: Bool

    let delegate: Delegate

    var body: some View {
        HStack {
            Text(title)

            Spacer()

            Group {
                Button("Move Up", systemImage: "arrow.up", action: delegate.onMoveUp)
                    .disabled(!canMoveUp)

                Button("Move Down", systemImage: "arrow.down", action: delegate.onMoveDown)
                    .disabled(!canMoveDown)

                Button("Delete", systemImage: "trash", role: .destructive, action: delegate.onDelete)
            }
            .labelStyle(.iconOnly)
        }
    }


    // MARK: - Delegate

    /// `Delegate` holds the events the view reports, as ``Component/Delegate`` describes.
    struct Delegate {

        let onMoveUp: () -> Void
        let onMoveDown: () -> Void
        let onDelete: () -> Void

    }
}


// MARK: - Previews

#Preview {
    let delegate = EventView.Delegate(
        onMoveUp: {},
        onMoveDown: {},
        onDelete: {},
    )

    VStack {
        EventView(title: "Title", canMoveUp: false, canMoveDown: true, delegate: delegate)
        EventView(title: "Title", canMoveUp: true, canMoveDown: true, delegate: delegate)
        EventView(title: "Title", canMoveUp: true, canMoveDown: false, delegate: delegate)
    }
    .padding()
}
