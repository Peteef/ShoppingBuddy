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
                            ListElement(of: shoppingList)
                        }
                    }
                    Button("Create list", systemImage: "plus.circle") {
                        viewModel.isOpenNewListView = true
                    }
                    .padding(.vertical, 10)
                }
                .navigationTitle("🛒 ShoppingBuddy")
                .sheet(isPresented: $viewModel.isOpenNewListView, content: {
                    NewListModalView(viewModel: NewListModalViewModel(), isOpen: $viewModel.isOpenNewListView)
                })
            }
            .onAppear {
                viewModel.load()
            }
            .onChange(of: viewModel.isOpenNewListView) {
                if !viewModel.isOpenNewListView {
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
