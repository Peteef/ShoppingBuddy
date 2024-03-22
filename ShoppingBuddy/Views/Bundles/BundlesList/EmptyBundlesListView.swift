//
//  EmptyBundlesListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 17/12/2023.
//

import SwiftUI

struct EmptyBundlesListView: View {
    @Environment(BundlesListViewModel.self) var viewModel: BundlesListViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("bundlesList.emptyState")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(.systemGray2))
            Button(action: {
                viewModel.isOpenNewBundleModal = true
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(.vertical, 8)
            })
            .accessibilityIdentifier("addFirstBundleButton")
            Spacer()
        }
    }
}

#Preview {
    EmptyBundlesListView()
        .environment(BundlesListViewModel(repository: Repositories.bundleRepository))
}
