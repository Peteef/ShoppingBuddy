//
//  ShoppingListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import SwiftUI

struct ShoppingListView: View {
    let shoppingList: ShoppingList

    init(of: ShoppingList) {
        self.shoppingList = of
    }

    var body: some View {
        ZStack {
            Text(shoppingList.name)
        }
    }
}

#Preview {
    ShoppingListView(of: Mocks.shoppingLists[0])
}
