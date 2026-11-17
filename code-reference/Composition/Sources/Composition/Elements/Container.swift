import SwiftUI

// TODO-18: Verify that SwiftUI cannot compare the closure, or revert to storing it.
/// A container wraps content it receives through a `@ViewBuilder` parameter, so it applies styling and layout without knowing the content.
///
/// It stores the content built in `init` instead of the closure, since SwiftUI cannot compare closures.
struct Container<Content: View>: View {

    let isHighlighted: Bool

    let content: Content

    init(
        isHighlighted: Bool,
        @ViewBuilder content: () -> Content,
    ) {
        self.isHighlighted = isHighlighted
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading) {
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(isHighlighted ? Color.accentColor.opacity(0.15) : Color.secondary.opacity(0.15), in: .rect(cornerRadius: 12))
    }
}


// MARK: - Previews

#Preview {
    VStack {
        Container(isHighlighted: false) {
            Text("Content")
        }

        Container(isHighlighted: true) {
            Text("Content")
        }
    }
    .padding()
}
