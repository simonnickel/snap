import SwiftUI

extension Composition {

    /// A view that edits a value owned elsewhere takes a binding to it.
    ///
    /// The owner keeps the value and accepts each change as is. When the owner should decide how to react, report the interaction instead, as ``EventView`` shows.
    ///
    /// It takes a binding to the one value it edits, not the model, so it stays reusable for any model with such a value.
    struct BindingView: View {

        let title: String

        @Binding var isOn: Bool

        var body: some View {
            Toggle(isOn: $isOn) {
                Text(title)
            }
            .padding()
            .background(isOn ? Color.accentColor.opacity(0.25) : .clear, in: .rect(cornerRadius: 8))
        }
    }

}


// MARK: - Previews

#Preview {
    VStack {
        Composition.BindingView(title: "Title", isOn: .constant(false))
        Composition.BindingView(title: "Title", isOn: .constant(true))
    }
    .padding()
}
