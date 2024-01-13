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
    private let repository = Repositories.shoppingListRepository

    var shoppingList: ShoppingList
    var isError: Bool = false

    var isOpenNewItemModal: Bool = false
    var isOpenAddBundleModal: Bool = false

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
