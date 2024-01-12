//
//  ListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
class ListViewModel {
    @ObservationIgnored
    private let repository = Repositories.shoppingListRepository
    
    var shoppingLists: [ShoppingList] = []
    var isLoading: Bool = false

    var isOpenNewListModal: Bool = false
    
    init() {
        load()
    }

    func load() {
        isLoading = true
        shoppingLists = repository.getAll()
        isLoading = false
    }
    
    func removeList(at indexes: IndexSet) {
        indexes.forEach { index in
            repository.remove(shoppingList: shoppingLists[index])
        }
        shoppingLists.remove(atOffsets: indexes)
    }
}
