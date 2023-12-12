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
    
    init(of: ShoppingList) {
        // TODO: Use optional value and handle absence
        self.shoppingList = repository.get(id: of.id) ?? Mocks.shoppingLists[2]
    }
    
    func update() {
        do {
            try repository.update(shoppingList: shoppingList)
        } catch ShoppingListError.alreadyExist(let withId) {
            print("Shopping list with id: \(withId) does not exist!")
        } catch {
            print("Something went wrong.")
        }
    }

}
