//
//  Bundle.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 19/12/2023.
//

import Foundation

struct ShoppingBundle: Identifiable, Hashable, ContainingItems {
    typealias I = BundleItem
    
    let id: String
    let name: String
    var items: [BundleItem]
    
    init(id: String = NSUUID().uuidString.lowercased(), name: String, items: [BundleItem] = []) {
        self.id = id
        self.name = name
        self.items = items
    }
    
    public static let none = ShoppingBundle(name: "none")
}

typealias BundleItem = String
