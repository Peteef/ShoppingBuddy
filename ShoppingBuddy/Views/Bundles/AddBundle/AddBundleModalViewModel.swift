//
//  AddBundleModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import Foundation
import SwiftUI

@Observable
final class AddBundleModalViewModel {
    private let bundleRepository = Repositories.bundleRepository
    
    var shoppingList: ShoppingList
    
    var bundles: [ShoppingBundle]
    var selected: ShoppingBundle
    
    init(shoppingList: ShoppingList) {
        let bundles = bundleRepository.getAll()
        self.bundles = bundles
        self.selected = bundles.first ?? .none // TODO: Figure out the safer way
        self.shoppingList = shoppingList
    }
    
    func addItems() {
        let items = selected.items
            .filter { candidate in shoppingList.items.allSatisfy { $0.content.lowercased() != candidate.lowercased() } }
            .map { ListItem(content: $0) }
        
        shoppingList.items.append(contentsOf: items)
        reset()
    }
    
    func reset() {
        selected = bundles.first ?? .none
    }
}
