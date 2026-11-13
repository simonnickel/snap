import Foundation
import Observation

/// A data source owns the data that outlives any view and is the single source of truth for it.
///
/// It can be any source of data, such as a store, a database or a network service. Only its role in the composition matters, not how it loads or stores the data.
///
/// Views edit a single item through bindings to its properties. Changes that a binding cannot express, such as adding or removing an item, go through a method.
@Observable class DataSource {

    var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    func addItem() {
        items.append(.mock())
    }

    func removeItem(id: Item.ID) {
        items.removeAll { $0.id == id }
    }
}


// MARK: - Item

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
