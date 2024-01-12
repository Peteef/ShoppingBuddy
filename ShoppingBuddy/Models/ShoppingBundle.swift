//
//  ShoppingBundle.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 19/12/2023.
//

import Foundation
import SwiftData

@Model
class ShoppingBundle: Identifiable, Hashable, ContainingItems {
    typealias I = BundleItem
    
    let name: String
    @Relationship (deleteRule: .cascade) var items: [BundleItem]
    
    init(name: String, items: [BundleItem] = []) {
        self.name = name
        self.items = items
    }
    
    public static let none = ShoppingBundle(name: "none")
}

typealias BundleItem = String
