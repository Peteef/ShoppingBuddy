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
        VStack {
            Text(shoppingList.name).padding()
            List(shoppingList.entries, id: \.id) { entry in
                Toggle(isOn: .constant(false), label: {
                    Text(entry.content)
                })
            }
        }
    }
}

#Preview {
    ShoppingListView(of: Mocks.shoppingList)
}
