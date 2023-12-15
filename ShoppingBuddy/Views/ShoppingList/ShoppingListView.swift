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
                HStack {
                    Text(viewModel.shoppingList.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    Spacer()
                }
                List {
                    ForEach($viewModel.shoppingList.items, id: \.id) { item in
                        ShoppingListItemView(item: item, onToggle: viewModel.update)
                    }
                    .onMove(perform: viewModel.moveItems)
                    .onDelete(perform: viewModel.removeItems)
                }.listStyle(.plain)
            }
            .toolbar {
                AddItemButton(isOpenModal: $viewModel.isOpenNewItemModal)
            }
            .sheet(isPresented: $viewModel.isOpenNewItemModal, content: {
                NewItemModalView(
                    viewModel: NewItemModalViewModel(
                        shoppingList: $viewModel.shoppingList,
                        onUpdate: viewModel.update
                    ),
                    isOpen: $viewModel.isOpenNewItemModal
                )
            })
        }
    }
}

#Preview {
    ShoppingListView(viewModel: ShoppingListViewModel(of: Mocks.shoppingList))
}
