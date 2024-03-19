//
//  TestRequireModelContextSync.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 22/02/2024.
//

import XCTest
import SwiftData
@testable import ShoppingBuddy

class TestRequiresModelContextSync: XCTestCase {
    // Needed in order to make SwiftData model working with updates
    // TODO: Think of a way to not be dependent on SwiftData code
    @MainActor internal func syncWithModelContext(_ syncable: any PersistentModel) {
        print("[\(name)] Syncing \(syncable) with modelContext...")
        StorageConfiguration.config.modelContext.insert(syncable)
    }
    
    @MainActor internal func cleanupStorage() {
        print("[\(name)] Cleaning up storage in...")
        try! StorageConfiguration.config.modelContext.delete(model: ShoppingList.self)
        try! StorageConfiguration.config.modelContext.delete(model: ShoppingBundle.self)
    }
}
