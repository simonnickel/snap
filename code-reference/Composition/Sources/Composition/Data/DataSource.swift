import Foundation
import Observation

/// A data source owns the data that outlives any view and is the single source of truth for it.
///
/// It can be any source of data, such as a store, a database or a network service. Only its role in the composition matters, not how it loads or stores the data.
///
/// Views edit a single item through bindings to its properties. Changes that a binding cannot express, such as adding, moving or removing an item, go through a method.
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

    func moveItem(id: Item.ID, by offset: Int) {
        guard let index = items.firstIndex(where: { $0.id == id }) else { return }

        let destination = index + offset
        guard items.indices.contains(destination) else { return }

        items.swapAt(index, destination)
    }
}
