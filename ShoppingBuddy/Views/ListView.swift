//
//  ListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack {
            List(Mocks.shoppingLists, id: \.id) { shoppingList in
                ListElement(of: shoppingList)
            }
            .navigationTitle("🛒 ShoppingBuddy")
        }
    }
}

#Preview {
    ListView()
}
