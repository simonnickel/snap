import SwiftUI

/// A simple Container View implementation example.
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
	Container() {
		Text("Test")
	}
}