import SwiftUI

/// A simple Container View implementation example.
struct Container<Content: View>: View {
	
	@ViewBuilder let content: () -> Content
	
	var body: some View {
		content()
	}
	
}


// MARK: - Preview

#Preview {
	Container() {
		Text("Test")
	}
}