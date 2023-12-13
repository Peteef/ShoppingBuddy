//
//  Mocks.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import Foundation

enum Mocks {
    static let shoppingList: ShoppingList = .init(
        name: "Kamil's list",
        items: [
            ListItem(content: "Eggs"),
            ListItem(content: "Milk"),
            ListItem(content: "Bread")
        ],
        createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    )

    static let shoppingLists: [ShoppingList] = [
        shoppingList,
        ShoppingList(name: "Kasia's list"),
        ShoppingList(name: "Home list"),
        ShoppingList(name: "Birthday list"),
        ShoppingList(name: "Party list"),
        ShoppingList(name: "Travel list")
    ]
}
