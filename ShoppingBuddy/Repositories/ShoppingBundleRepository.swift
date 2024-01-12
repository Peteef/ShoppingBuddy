//
//  ShoppingBundleRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation
import SwiftData

final class ShoppingBundleRepository {
    private let modelContainer = StorageConfiguration.config.modelContainer
    private let modelContext = StorageConfiguration.config.modelContext
    
    func getAll() -> [ShoppingBundle] {
        do {
            return try modelContext.fetch(FetchDescriptor<ShoppingBundle>(sortBy: [SortDescriptor(\.createdAt)]))
        } catch {
            print("Could not fetch shopping bundles.")
            return []
        }
    }
    
    func get(id: PersistentIdentifier) -> ShoppingBundle? {
        return modelContext.model(for: id) as? ShoppingBundle
    }
    
    func add(bundle: ShoppingBundle) {
        modelContext.insert(bundle)
    }
    
    func remove(bundle: ShoppingBundle) {
        modelContext.delete(bundle)
    }
}
