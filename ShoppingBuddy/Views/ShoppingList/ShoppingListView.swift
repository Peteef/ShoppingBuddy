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
                List($viewModel.shoppingList.items, id: \.id) { item in
                    Toggle(isOn: item.checked, label: {
                        Text(item.wrappedValue.content)
                    }).onChange(of: item.wrappedValue.checked) {
                        viewModel.update()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add item") {
                        viewModel.isOpenNewItemView = true
                    }
                }
            }
            .sheet(isPresented: $viewModel.isOpenNewItemView, content: {
                NewItemModalView(
                    viewModel: NewItemModalViewModel(
                        shoppingList: $viewModel.shoppingList,
                        onUpdate: viewModel.update
                    ),
                    isOpen: $viewModel.isOpenNewItemView
                )
            })
        }
    }
}

#Preview {
    ShoppingListView(viewModel: ShoppingListViewModel(of: Mocks.shoppingList))
}
