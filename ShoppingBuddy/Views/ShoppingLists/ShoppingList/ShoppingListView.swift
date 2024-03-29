//
//  ShoppingListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import SwiftUI

struct ShoppingListView: View {
    @State var viewModel: ShoppingListViewModel

    var body: some View {
        if !viewModel.isError {
            VStack {
                HStack {
                    Text(viewModel.shoppingList.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .accessibilityIdentifier("shoppingListName")
                    Spacer()
                }
                if viewModel.shoppingList.items.isEmpty {
                    EmptyShoppingListView()
                } else {
                    List {
                        ForEach($viewModel.shoppingList.items, id: \.content) { item in
                            ShoppingListItemView(item: item)
                        }
                        .onDelete(perform: viewModel.removeItems)
                    }.listStyle(.plain)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    ClearDoneButton()
                        .accessibilityIdentifier("clearDoneButton")
                    AddItemButton(isOpenModal: $viewModel.isOpenNewItemModal)
                        .accessibilityIdentifier("addItemButton")
                    AddBundleButton(isOpenModal: $viewModel.isOpenAddBundleModal)
                        .accessibilityIdentifier("addBundleButton")
                }
            }
            .sheet(isPresented: $viewModel.isOpenNewItemModal, content: {
                NewItemModalView(
                    viewModel: NewItemModalViewModel<ShoppingList>(
                        containingItems: viewModel.shoppingList,
                        createItem: { ListItem(content: $0) }
                    ),
                    isOpen: $viewModel.isOpenNewItemModal
                )
            })
            .sheet(isPresented: $viewModel.isOpenAddBundleModal, content: {
                AddBundleModalView(
                    viewModel: AddBundleModalViewModel(
                        shoppingList: viewModel.shoppingList,
                        repository: Repositories.bundleRepository
                    ),
                    isOpen: $viewModel.isOpenAddBundleModal
                )
            })
            .environment(viewModel)
        }
       
    }
}

// TODO: Fix previews depending on state
// #Preview {
//    ShoppingListView(viewModel: ShoppingListViewModel(of: Mocks.shoppingList))
// }
