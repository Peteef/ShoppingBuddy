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
    let createdAt: Date
    
    init(name: String, items: [BundleItem] = [], createdAt: Date = .now) {
        self.name = name
        self.items = items
        self.createdAt = createdAt
    }
    
    public static let none = ShoppingBundle(name: "none", createdAt: Date.distantPast)
}

typealias BundleItem = String
