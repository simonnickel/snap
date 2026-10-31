import SwiftUI

// TODO-18: Verify that SwiftUI cannot compare the closure, or revert to storing it.
/// A container view that stores its content built in `init` instead of the `@ViewBuilder` closure.
/// See "View composition" in `docs/conventions/swiftui.md`.
struct Container<Content: View>: View {
	
	let content: Content

	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}

	var body: some View {
		content
	}
	
}


// MARK: - Preview

#Preview {
	Container {
		Text("Test")
	}
}