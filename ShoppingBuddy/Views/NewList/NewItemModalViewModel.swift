//
//  NewListModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import Foundation
import SwiftUI

final class NewItemModalViewModel: ObservableObject {
    @Binding var shoppingList: ShoppingList
    
    @Published var content: String = ""
    @Published var showAlert: Bool = false
    
    init(shoppingList: Binding<ShoppingList>) {
        self._shoppingList = shoppingList
    }
    
    var canAdd: Bool {
        return !content.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func addNewItem() {
        // TODO: Add better error handling here
        guard canAdd else {
            return
        }
        
        shoppingList.items.append(ListItem(content: content))
        reset()
    }
    
    func reset() {
        content = ""
    }
}
