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
    var entries: [ListEntry]
    let createdAt: Date

    init(id: String = NSUUID().uuidString.lowercased(), name: String, entries: [ListEntry] = [], createdAt: Date = Date.now) {
        self.id = id
        self.name = name
        self.entries = entries
        self.createdAt = createdAt
    }

    public static let none: ShoppingList = .init(id: "none", name: "none", entries: [], createdAt: Date.distantPast)
}

struct ListEntry {
    let id: String
    let content: String
    var checked: Bool
}
