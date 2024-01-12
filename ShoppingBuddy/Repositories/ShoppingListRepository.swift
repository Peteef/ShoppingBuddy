//
//  ShoppingListRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/01/2024.
//

import Foundation
import SwiftData

final class ShoppingListRepository {
    private let modelContainer = StorageConfiguration.config.modelContainer
    private let modelContext = StorageConfiguration.config.modelContext
    
    func getAll() -> [ShoppingList] {
        do {
            return try modelContext.fetch(FetchDescriptor<ShoppingList>(sortBy: [SortDescriptor(\.createdAt, order: .reverse)]))
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
