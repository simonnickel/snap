import Foundation
import Observation

extension DataSource {

    /// An item is the model a data source owns. Every layer reads it, from the screen down to its views.
    ///
    /// It is an observable class, like a SwiftData `@Model`, so a view keeps a valid reference after the item is removed. A binding into the data source's array points to an index and crashes when a removed row reads it.
    ///
    /// Views bind to its properties with `@Bindable`, which only reaches `var` properties, so the choice between `let` and `var` decides what views may edit.
    @Observable final class Item: Identifiable {

        let id: UUID
        let title: String
        var isEnabled: Bool

        init(
            id: UUID,
            title: String,
            isEnabled: Bool,
        ) {
            self.id = id
            self.title = title
            self.isEnabled = isEnabled
        }
    }

}


// MARK: - Mock

extension DataSource.Item {
    static func mock(isEnabled: Bool = false) -> Self {
        .init(
            id: UUID(),
            title: "Item",
            isEnabled: isEnabled,
        )
    }
}
