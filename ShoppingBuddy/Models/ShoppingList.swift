//
//  ShoppingList.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import Foundation

struct ShoppingList {
    let id: String
    let name: String
    var entries: [ListEntry]

    init(id: String, name: String, entries: [ListEntry] = []) {
        self.id = id
        self.name = name
        self.entries = entries
    }

    public static let none: ShoppingList = .init(id: "none", name: "none", entries: [])
}

struct ListEntry {
    let id: String
    let content: String
    var checked: Bool
}
