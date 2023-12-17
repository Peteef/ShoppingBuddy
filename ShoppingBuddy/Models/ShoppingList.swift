//
//  ShoppingList.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import Foundation

struct ShoppingList: Identifiable {
    let id: String
    let name: String
    var items: [ListItem]
    let createdAt: Date

    init(id: String = NSUUID().uuidString.lowercased(), name: String, items: [ListItem] = [], createdAt: Date = Date.now) {
        self.id = id
        self.name = name
        self.items = items
        self.createdAt = createdAt
    }

    public static let none: ShoppingList = .init(id: "none", name: "none", items: [], createdAt: Date.distantPast)
}

struct ListItem {
    let id: String
    let content: String
    var checked: Bool

    init(id: String = NSUUID().uuidString.lowercased(), content: String, checked: Bool = false) {
        self.id = id
        self.content = content
        self.checked = checked
    }
}
