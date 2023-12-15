//
//  ListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import Foundation

final class ListViewModel: ObservableObject {
    private let repository: ShoppingListRepository = InMemoryRepository.shoppingListRepository

    @Published var shoppingLists: [ShoppingList] = []
    @Published var isLoading: Bool = false

    @Published var isOpenNewListView: Bool = false

    func load() {
        isLoading = true
        shoppingLists = repository.getAll()
        isLoading = false
    }
    
    func removeList(at indexes: IndexSet) {
        indexes.forEach { index in
            repository.remove(id: shoppingLists[index].id)
        }
        shoppingLists.remove(atOffsets: indexes)
    }
}
