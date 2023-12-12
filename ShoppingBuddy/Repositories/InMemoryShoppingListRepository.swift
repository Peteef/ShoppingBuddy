//
//  InMemoryShoppingListRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation

class InMemoryShoppingListRepository: ShoppingListRepository {
    private var data: Dictionary<String, ShoppingList> = [:]
    
    init() {
        Mocks.shoppingLists.forEach { shoppingList in
            data[shoppingList.id] = shoppingList
        }
    }
    
    func getAll() -> [ShoppingList] {
        Array(data.values)
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
    
    
}
