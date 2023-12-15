//
//  ShoppingListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation

final class ShoppingListViewModel: ObservableObject {
    private let repository: ShoppingListRepository = InMemoryRepository.shoppingListRepository

    @Published var shoppingList: ShoppingList
    @Published var isError: Bool = false
    
    @Published var isOpenNewItemView: Bool = false

    init(of: ShoppingList) {
        if let fromRepository = repository.get(id: of.id) {
            self.shoppingList = fromRepository
        } else {
            self.shoppingList = ShoppingList.none
            self.isError = true
        }
    }
    
    func moveItems(from: IndexSet, to: Int) {
        shoppingList.items.move(fromOffsets: from, toOffset: to)
        update()
    }
    
    func removeItems(at: IndexSet) {
        shoppingList.items.remove(atOffsets: at)
        update()
    }

    func update() {
        do {
            try repository.update(shoppingList: shoppingList)
        } catch let ShoppingListError.alreadyExist(withId) {
            print("Shopping list with id: \(withId) does not exist!")
        } catch {
            print("Something went wrong.")
        }
    }
}
