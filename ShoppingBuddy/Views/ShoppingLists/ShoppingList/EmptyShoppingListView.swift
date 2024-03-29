//
//  EmptyShoppingListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 17/12/2023.
//

import SwiftUI

struct EmptyShoppingListView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("shoppingList.emptyState")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(.systemGray2))
                .accessibilityIdentifier("shoppingListEmptyState")
            Spacer()
        }
    }
}

#Preview {
    EmptyShoppingListView()
}
