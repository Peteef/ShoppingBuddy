//
//  BundlesNavigationView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 20/12/2023.
//

import SwiftUI

struct BundlesNavigationView: View {
    @StateObject var viewModel: BundlesNavigationViewModel

    var body: some View {
        ZStack {
            if viewModel.selectedBundle == nil {
                BundlesListView(viewModel: BundlesListViewModel(
                    selectedBundle: $viewModel.selectedBundle
                ))
                .transition(.asymmetric(
                    insertion: .move(edge: .leading),
                    removal: .move(edge: .leading)
                ))
            } else {
                BundleView(viewModel: BundleViewModel(of: $viewModel.selectedBundle))
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .trailing)
                    ))
            }
        }
    }
}

#Preview {
    BundlesNavigationView(viewModel: BundlesNavigationViewModel())
}
