//
//  InMemoryShoppingListRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation

class InMemoryShoppingListRepository: ShoppingListRepository {
    
    private var data: [String: ShoppingList] = [:]
    
    func getAll() -> [ShoppingList] {
        Array(data.values).sorted {
            $0.createdAt > $1.createdAt
        }
    }
    
    func get(id: String) -> ShoppingList? {
        data[id]
    }
    
    func add(shoppingList: ShoppingList) throws {
        let id = shoppingList.id
        if data.keys.contains(id) {
            throw ShoppingListError.alreadyExist(withId: id)
        }
        data[id] = shoppingList
    }
    
    func update(shoppingList: ShoppingList) throws {
        let id = shoppingList.id
        if !data.keys.contains(id) {
            throw ShoppingListError.notExist(withId: id)
        }
        data[id] = shoppingList
    }
    
    func remove(id: String) {
        data.removeValue(forKey: id)
    }
}
