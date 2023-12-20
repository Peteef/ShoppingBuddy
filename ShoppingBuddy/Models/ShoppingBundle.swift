//
//  Bundle.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 19/12/2023.
//

import Foundation

struct ShoppingBundle {
    let id: String
    let name: String
    let items: [BundleItem]
    
    init(id: String = NSUUID().uuidString.lowercased(), name: String, items: [BundleItem] = []) {
        self.id = id
        self.name = name
        self.items = items
    }
    
    public static let none = ShoppingBundle(name: "none")
}

typealias BundleItem = String
