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
    let entries: [ListEntry]
    
    init(id: String, name: String, entries: [ListEntry] = []) {
        self.id = id
        self.name = name
        self.entries = entries
    }
}

struct ListEntry {
    let id: String
    let content: String
    let checked: Bool
}
