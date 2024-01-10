//
//  ShoppingListRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/01/2024.
//

import Foundation
import SwiftData

class ShoppingListRepository {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let instance = ShoppingListRepository()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: ShoppingList.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func getAll() -> [ShoppingList] {
        do {
            return try modelContext.fetch(FetchDescriptor<ShoppingList>())
        } catch {
            print("Could not fetch shopping lists.")
            return []
        }
    }
    
    func get(id: PersistentIdentifier) -> ShoppingList? {
        return modelContext.model(for: id) as? ShoppingList
    }
    
    func add(shoppingList: ShoppingList) {
        modelContext.insert(shoppingList)
    }
    
    func remove(shoppingList: ShoppingList) {
        modelContext.delete(shoppingList)
    }
    
    
}
