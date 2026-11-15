import SwiftUI

/// A view that edits a value owned elsewhere takes a binding to it, when the owner accepts each change as is.
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


// MARK: - Previews

#Preview {
    VStack {
        BindingView(title: "Title", isOn: .constant(false))
        BindingView(title: "Title", isOn: .constant(true))
    }
    .padding()
}
