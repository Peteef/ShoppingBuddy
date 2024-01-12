//
//  NewItemModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import Foundation
import SwiftUI

final class NewItemModalViewModel<T>: ObservableObject where T: ContainingItems {
    @Binding var containingItems: T
    let createItem: (String) -> T.I
    
    @Published var content: String = ""
    @Published var showAlert: Bool = false
    
    init(containingItems: Binding<T>, createItem: @escaping (String) -> T.I) {
        self._containingItems = containingItems
        self.createItem = createItem
    }
    
    var canAdd: Bool {
        return !content.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func addNewItem() {
        // TODO: Add better error handling here
        guard canAdd else {
            return
        }
        
        containingItems.items.append(createItem(content.trimmingCharacters(in: .whitespaces)))
        reset()
    }
    
    func reset() {
        content = ""
    }
}
