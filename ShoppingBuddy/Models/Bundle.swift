//
//  Bundle.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 19/12/2023.
//

import Foundation

struct Bundle {
    let id: String
    let name: String
    let items: [BundleItem]
    
    init(id: String = NSUUID().uuidString.lowercased(), name: String, items: [BundleItem] = []) {
        self.id = id
        self.name = name
        self.items = items
    }
}

typealias BundleItem = String
