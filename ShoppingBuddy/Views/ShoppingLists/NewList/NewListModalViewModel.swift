//
//  NewListModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import Foundation

@Observable
final class NewListModalViewModel {
    private let repository: ShoppingListRepository

    var name: String = ""
    var showAlert: Bool = false
    
    init(repository: ShoppingListRepository) {
        self.repository = repository
    }

    var canAdd: Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func addNewList() {
        // TODO: Add better error handling here
        guard canAdd else {
            return
        }

        repository.add(shoppingList: ShoppingList(name: name.trimmingCharacters(in: .whitespaces)))
        reset()
    }
    
    func reset() {
        name = ""
    }
}
