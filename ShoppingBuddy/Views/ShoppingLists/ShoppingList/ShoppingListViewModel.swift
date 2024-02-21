//
//  ShoppingListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation
import SwiftUI

@Observable
final class ShoppingListViewModel {
    @ObservationIgnored
    private let repository: ShoppingListRepository

    var shoppingList: ShoppingList
    var isError: Bool = false

    var isOpenNewItemModal: Bool = false
    var isOpenAddBundleModal: Bool = false

    init(of: ShoppingList, repository: ShoppingListRepository) {
        self.repository = repository
        if let fromRepository = repository.get(id: of.id) {
            self.shoppingList = fromRepository
        } else {
            self.shoppingList = .none
            self.isError = true
        }
    }

    func removeItems(at: IndexSet) {
        shoppingList.items.remove(atOffsets: at)
    }

    func removeCheckedItems() {
        shoppingList.items.removeAll(where: { item in item.checked })
    }
}
