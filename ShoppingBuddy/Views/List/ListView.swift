//
//  ListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel: ListViewModel

    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(viewModel.shoppingLists, id: \.id) { shoppingList in
                        NavigationLink {
                            ShoppingListView(viewModel: ShoppingListViewModel(of: shoppingList))
                        } label: {
                            ListElementView(of: shoppingList)
                        }
                    }
                    .onDelete(perform: viewModel.removeList)
                    Button("Create list", systemImage: "plus.circle") {
                        viewModel.isOpenNewListModal = true
                    }
                    .padding(.vertical, 10)
                }
                .navigationTitle("🛒 ShoppingBuddy")
                .sheet(isPresented: $viewModel.isOpenNewListModal, content: {
                    NewListModalView(viewModel: NewListModalViewModel(), isOpen: $viewModel.isOpenNewListModal)
                })
            }
            .onAppear {
                viewModel.load()
            }
            .onChange(of: viewModel.isOpenNewListModal) {
                if !viewModel.isOpenNewListModal {
                    viewModel.load()
                }
            }

            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
}
