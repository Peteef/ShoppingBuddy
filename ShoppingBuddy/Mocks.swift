//
//  Mocks.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import Foundation

struct Mocks {
    static let shoppingList: ShoppingList = ShoppingList(
        id: NSUUID().uuidString.lowercased(),
        name: "Kamil's list",
        entries: [
            ListEntry(id: NSUUID().uuidString.lowercased(), content: "Eggs", checked: false),
            ListEntry(id: NSUUID().uuidString.lowercased(), content: "Milk", checked: false),
            ListEntry(id: NSUUID().uuidString.lowercased(), content: "Bread", checked: false)
        ]
    )
    
    static let shoppingLists: [ShoppingList] = [
        shoppingList,
        ShoppingList(id: NSUUID().uuidString.lowercased(), name: "Kasia's list"),
        ShoppingList(id: NSUUID().uuidString.lowercased(), name: "Home list"),
        ShoppingList(id: NSUUID().uuidString.lowercased(), name: "Birthday list"),
        ShoppingList(id: NSUUID().uuidString.lowercased(), name: "Party list"),
        ShoppingList(id: NSUUID().uuidString.lowercased(), name: "Travel list")
    ]
}

