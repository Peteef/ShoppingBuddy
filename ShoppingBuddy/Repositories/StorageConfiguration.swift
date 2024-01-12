//
//  StorageConfiguration.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/01/2024.
//

import Foundation
import SwiftData

final class StorageConfiguration {
    let modelContainer: ModelContainer
    let modelContext: ModelContext

    @MainActor
    static let config = StorageConfiguration()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: ShoppingList.self, ShoppingBundle.self)
        self.modelContext = modelContainer.mainContext
    }
}
