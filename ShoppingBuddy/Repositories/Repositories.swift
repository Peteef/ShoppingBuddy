//
//  Repositories.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/01/2024.
//

import Foundation

struct Repositories {
    static let shoppingListRepository: ShoppingListRepository = DatabaseShoppingListRepository()
    static let bundleRepository: ShoppingBundleRepository = DatabaseShoppingBundleRepository()
}
