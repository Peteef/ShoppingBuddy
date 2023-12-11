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
                List(viewModel.shoppingLists, id: \.id) { shoppingList in
                    NavigationLink {
                        ShoppingListView(of: shoppingList)
                    } label: {
                        ListElement(of: shoppingList)
                    }
                }
                .navigationTitle("🛒 ShoppingBuddy")
            }
            .onAppear {
                viewModel.load()
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
