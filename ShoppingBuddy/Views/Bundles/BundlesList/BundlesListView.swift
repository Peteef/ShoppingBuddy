//
//  BundlesListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 19/12/2023.
//

import SwiftUI

struct BundlesListView: View {
    @State var viewModel: BundlesListViewModel

    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
            } else if viewModel.bundles.isEmpty {
                EmptyBundlesListView()
            } else {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                    ForEach(viewModel.bundles, id: \.id) { bundle in
                        BundleTileView(of: bundle)
                    }
                    NewBundleTileView()
                }
            }
        }
        .environment(viewModel)
        .sheet(isPresented: $viewModel.isOpenNewBundleModal, content: {
            NewBundleModalView(viewModel: NewBundleModalViewModel(), isOpen: $viewModel.isOpenNewBundleModal)
        })
        .onChange(of: viewModel.isOpenNewBundleModal) {
            if !viewModel.isOpenNewBundleModal {
                viewModel.load()
            }
        }
        .onAppear {
            viewModel.load()
        }
    }
}

#Preview {
    BundlesListView(viewModel: BundlesListViewModel())
}
