//
//  ListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import SwiftUI

struct ListView: View {
    @State var viewModel: ListViewModel

    var body: some View {
        VStack {
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
                    Button(String(localized: "list.createListButton"), systemImage: "plus.circle") {
                        viewModel.isOpenNewListModal = true
                    }
                    .padding(.vertical, 8)
                }
                .listRowSpacing(16)
                .navigationTitle(String(localized: "appName"))
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
