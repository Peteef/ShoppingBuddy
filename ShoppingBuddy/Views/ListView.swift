//
//  ListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel: ListViewModel
    
    @State private var selectedList: ShoppingList? = nil
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.shoppingLists, id: \.id) { shoppingList in
                    ListElement(shoppingList: shoppingList, selectedList: $selectedList)
                }
                .navigationTitle("🛒 ShoppingBuddy")
            }
            .onAppear {
                viewModel.load()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if selectedList != nil {
                ShoppingListView(of: selectedList!)
            }
        }
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
}
