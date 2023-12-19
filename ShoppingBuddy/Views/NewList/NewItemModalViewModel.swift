//
//  NewItemModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import Foundation
import SwiftUI

final class NewItemModalViewModel: ObservableObject {
    @Binding var shoppingList: ShoppingList
    let onUpdate: () -> Void
    
    @Published var content: String = ""
    @Published var showAlert: Bool = false
    
    init(shoppingList: Binding<ShoppingList>, onUpdate: @escaping () -> Void) {
        self._shoppingList = shoppingList
        self.onUpdate = onUpdate
    }
    
    var canAdd: Bool {
        return !content.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func addNewItem() {
        // TODO: Add better error handling here
        guard canAdd else {
            return
        }
        
        shoppingList.items.append(ListItem(content: content.trimmingCharacters(in: .whitespaces)))
        onUpdate()
        reset()
    }
    
    func reset() {
        content = ""
    }
}
