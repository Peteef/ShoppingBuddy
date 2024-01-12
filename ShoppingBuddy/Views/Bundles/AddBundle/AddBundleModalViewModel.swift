//
//  AddBundleModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import Foundation
import SwiftUI

final class AddBundleModalViewModel: ObservableObject {
    private let bundleRepository = Repositories.bundleRepository

    let onUpdate: () -> Void
    
    @Binding var shoppingList: ShoppingList
    
    @Published var bundles: [ShoppingBundle]
    @Published var selected: ShoppingBundle
    
    init(shoppingList: Binding<ShoppingList>, onUpdate: @escaping () -> Void) {
        let bundles = bundleRepository.getAll()
        self.bundles = bundles
        self.selected = bundles.first ?? .none // TODO: Figure out the safer way
        self._shoppingList = shoppingList
        self.onUpdate = onUpdate
    }
    
    func addItems() {
        let items = selected.items
            .filter { candidate in shoppingList.items.allSatisfy { $0.content.lowercased() != candidate.lowercased() } }
            .map { ListItem(content: $0) }
        
        shoppingList.items.append(contentsOf: items)
        onUpdate()
        reset()
    }
    
    func reset() {
        selected = bundles.first ?? .none
    }
}
