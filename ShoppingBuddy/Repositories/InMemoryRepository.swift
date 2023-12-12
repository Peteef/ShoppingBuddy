//
//  InMemoryRepositories.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation

struct InMemoryRepository {
    public static let shoppingListRepository: ShoppingListRepository = InMemoryShoppingListRepository()
}
