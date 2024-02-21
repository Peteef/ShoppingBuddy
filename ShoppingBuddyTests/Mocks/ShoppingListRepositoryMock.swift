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
    }
    
    func remove(shoppingList: ShoppingList) {
        register(#function)
    }
}
