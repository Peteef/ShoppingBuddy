//
//  ShoppingList.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import Foundation
import SwiftData

@Model
class ShoppingList: Identifiable, ContainingItems {
    typealias I = ListItem
    
    let name: String
    @Relationship (deleteRule: .cascade) var items: [ListItem]
    let createdAt: Date

    init(name: String, items: [ListItem] = [], createdAt: Date = .now) {
        self.name = name
        self.items = items
        self.createdAt = createdAt
    }

    public static let none: ShoppingList = .init(name: "none", items: [], createdAt: Date.distantPast)
}

@Model
class ListItem: Identifiable {
    let content: String
    var checked: Bool
    let createdAt: Date

    init(content: String, checked: Bool = false, createdAt: Date = .now) {
        self.content = content
        self.checked = checked
        self.createdAt = createdAt
    }
}
