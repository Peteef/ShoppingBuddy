//
//  ShoppingListRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

protocol ShoppingListRepository {
    func getAll() -> [ShoppingList]
    func get(id: String) -> ShoppingList?
    func add(shoppingList: ShoppingList) throws
    func update(shoppingList: ShoppingList) throws
    func remove(id: String)
}
