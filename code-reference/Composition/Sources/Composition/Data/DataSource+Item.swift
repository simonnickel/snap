import Foundation
import Observation

extension DataSource {

    /// A model is the data a data source owns. Screens and components read it. Presentational views receive only the values they show or edit, so they stay independent of the model.
    ///
    /// It is an observable class, like a SwiftData `@Model`, so a view keeps a valid reference after the model is removed. A binding into a collection points to an index and crashes when a removed row reads it.
    ///
    /// Components bind to its properties with `@Bindable`, which only reaches `var` properties, so the choice between `let` and `var` decides what views may edit.
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
