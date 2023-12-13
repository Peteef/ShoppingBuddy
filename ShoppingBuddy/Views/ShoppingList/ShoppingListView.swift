//
//  ShoppingListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import SwiftUI

struct ShoppingListView: View {
    @StateObject var viewModel: ShoppingListViewModel

    var body: some View {
        if !viewModel.isError {
            VStack {
                Text(viewModel.shoppingList.name)
                List($viewModel.shoppingList.entries, id: \.id) { entry in
                    Toggle(isOn: entry.checked, label: {
                        Text(entry.wrappedValue.content)
                    }).onChange(of: entry.wrappedValue.checked) {
                        viewModel.update()
                    }
                }
            }
        }
    }
}

#Preview {
    ShoppingListView(viewModel: ShoppingListViewModel(of: Mocks.shoppingList))
}
