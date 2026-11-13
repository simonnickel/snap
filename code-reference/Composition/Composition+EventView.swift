import SwiftUI

extension Composition {

    /// A view that reports an interaction takes the values it shows and an `on...` closure for each interaction.
    ///
    /// It changes nothing itself, so the owner decides how to react, such as animating the change or ignoring it. When the change is a direct edit of a value, take a binding instead, as ``BindingView`` shows.
    ///
    /// Each closure is named after what happened in the view, such as `onToggle`. See "Naming" in `docs/conventions/naming.md`.
    struct EventView: View {

        let title: String
        let isCollapsed: Bool

        let onToggle: () -> Void

        var body: some View {
            Button(action: onToggle) {
                HStack {
                    Text(title)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isCollapsed ? -90 : 0))
                }
                // Makes the space between title and chevron tappable.
                .contentShape(.rect)
            }
        }

    }

}


// MARK: - Previews

#Preview {
    VStack {
        Composition.EventView(title: "Title", isCollapsed: false) {}
        Composition.EventView(title: "Title", isCollapsed: true) {}
    }
    .padding()
}
