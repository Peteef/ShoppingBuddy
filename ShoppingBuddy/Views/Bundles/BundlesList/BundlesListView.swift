//
//  BundlesListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 19/12/2023.
//

import SwiftUI

struct BundlesListView: View {
    @StateObject var viewModel: BundlesListViewModel

    var body: some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
            } else if viewModel.bundles.isEmpty {
                EmptyBundlesListView(onCreate: { viewModel.isOpenNewBundleModal = true })
            } else {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                    ForEach(viewModel.bundles, id: \.id) { bundle in
                        BundleTileView(of: bundle, onTap: {
                            withAnimation(.easeOut(duration: 0.4)) {
                                viewModel.selectedBundle = bundle
                            }
                        })
                    }
                    NewBundleTileView(onTap:{
                        viewModel.isOpenNewBundleModal = true
                    })
                }
            }
        }
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
    BundlesListView(viewModel: BundlesListViewModel(
        selectedBundle: .constant(nil)
    ))
}
