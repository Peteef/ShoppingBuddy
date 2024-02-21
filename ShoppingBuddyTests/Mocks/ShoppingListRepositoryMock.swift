//
//  ShoppingListRepositoryMock.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 20/02/2024.
//

import Foundation
import SwiftData
@testable import ShoppingBuddy

final class ShoppingListRepositoryMock: Mock, ShoppingListRepository {
    var whenGetAll: [ShoppingList] = []
    var whenGet: ShoppingList? = nil
    
    var saved: [ShoppingList] = []
    
    func getAll() -> [ShoppingList] {
        register(#function)
        return whenGetAll
    }

    func get(id: PersistentIdentifier) -> ShoppingList? {
        register(#function)
        return whenGet
    }
    
    func add(shoppingList: ShoppingList) {
        register(#function)
        saved.append(shoppingList)
    }
    
    func remove(shoppingList: ShoppingList) {
        register(#function)
    }
    
    override func resetInvocations() {
        super.resetInvocations()
        saved = []
    }
}
