//
//  ContentView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 10/12/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ListView(viewModel: ListViewModel())
                .tabItem {
                    Image(systemName: "cart")
                    Text("tabs.lists")
                }
            BundlesListView()
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
