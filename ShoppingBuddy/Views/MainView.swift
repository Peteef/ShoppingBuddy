//
//  MainView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
        TabView {
            ListView(viewModel: ListViewModel(repository: Repositories.shoppingListRepository))
                .tabItem {
                    Image(systemName: "cart")
                    Text("tabs.lists")
                }
            BundlesNavigationView(viewModel: BundlesNavigationViewModel())
                .tabItem {
                    Image(systemName: "basket")
                    Text("tabs.bundles")
                }
        }
    }
}

#Preview {
    MainView()
}
