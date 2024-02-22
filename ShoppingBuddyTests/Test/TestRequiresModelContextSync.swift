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
        StorageConfiguration.config.modelContext.insert(syncable)
    }
}
