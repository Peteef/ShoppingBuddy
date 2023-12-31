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
                if viewModel.shoppingList.items.isEmpty {
                    EmptyShoppingListView()
                } else {
                    List {
                        ForEach($viewModel.shoppingList.items, id: \.id) { item in
                            ShoppingListItemView(item: item, onToggle: viewModel.update)
                        }
                        .onMove(perform: viewModel.moveItems)
                        .onDelete(perform: viewModel.removeItems)
                    }.listStyle(.plain)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    ClearDoneButton(onClear: viewModel.removeCheckedItems)
                    AddItemButton(isOpenModal: $viewModel.isOpenNewItemModal)
                    AddBundleButton(isOpenModal: $viewModel.isOpenAddBundleModal)
                }
            }
            .sheet(isPresented: $viewModel.isOpenNewItemModal, content: {
                NewItemModalView(
                    viewModel: NewItemModalViewModel<ShoppingList>(
                        containingItems: $viewModel.shoppingList,
                        createItem: { ListItem(content: $0) },
                        onUpdate: viewModel.update
                    ),
                    isOpen: $viewModel.isOpenNewItemModal
                )
            })
            .sheet(isPresented: $viewModel.isOpenAddBundleModal, content: {
                AddBundleModalView(
                    viewModel: AddBundleModalViewModel(
                        shoppingList: $viewModel.shoppingList,
                        onUpdate: viewModel.update
                    ),
                    isOpen: $viewModel.isOpenAddBundleModal
                )
            })
        }
    }
}

#Preview {
    ShoppingListView(viewModel: ShoppingListViewModel(of: Mocks.shoppingList))
}
