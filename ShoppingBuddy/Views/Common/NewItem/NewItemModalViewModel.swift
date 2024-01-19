//
//  NewItemModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import Foundation
import SwiftUI

@Observable
final class NewItemModalViewModel<T> where T: ContainingItems {
    var containingItems: T
    let createItem: (String) -> T.I
    
    var content: String = ""
    var showAlert: Bool = false
    
    init(containingItems: T, createItem: @escaping (String) -> T.I) {
        self.containingItems = containingItems
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
