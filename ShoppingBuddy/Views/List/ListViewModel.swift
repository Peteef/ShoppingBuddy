//
//  ListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import Foundation

final class ListViewModel: ObservableObject {
    @Published var shoppingLists: [ShoppingList] = []
    @Published var isLoading: Bool = false
    
    func load() {
        isLoading = true
        // TODO: Implement fetching
        shoppingLists = Mocks.shoppingLists
        isLoading = false
    }
}
