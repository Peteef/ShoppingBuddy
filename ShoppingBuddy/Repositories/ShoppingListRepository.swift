//
//  ShoppingListRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 08/02/2024.
//

import Foundation
import SwiftData

protocol ShoppingListRepository {
    func getAll() -> [ShoppingList]
    func get(id: PersistentIdentifier) -> ShoppingList?
    func add(shoppingList: ShoppingList)
    func remove(shoppingList: ShoppingList)
}
