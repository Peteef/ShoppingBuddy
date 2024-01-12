//
//  ShoppingListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation

final class ShoppingListViewModel: ObservableObject {
    private let repository = Repositories.shoppingListRepository

    @Published var shoppingList: ShoppingList
    @Published var isError: Bool = false
    
    @Published var isOpenNewItemModal: Bool = false
    @Published var isOpenAddBundleModal: Bool = false

    init(of: ShoppingList) {
        if let fromRepository = repository.get(id: of.id) {
            self.shoppingList = fromRepository
        } else {
            self.shoppingList = .none
            self.isError = true
        }
    }
    
    func moveItems(from: IndexSet, to: Int) {
        shoppingList.items.move(fromOffsets: from, toOffset: to)
    }
    
    func removeItems(at: IndexSet) {
        shoppingList.items.remove(atOffsets: at)
    }
    
    func removeCheckedItems() {
        shoppingList.items.removeAll(where: { item in item.checked })
    }
}
