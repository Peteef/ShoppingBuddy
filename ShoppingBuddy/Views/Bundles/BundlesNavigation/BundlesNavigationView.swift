//
//  BundlesNavigationView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 20/12/2023.
//

import SwiftUI

struct BundlesNavigationView: View {
    @State var viewModel: BundlesNavigationViewModel

    var body: some View {
        ZStack {
            if viewModel.selectedBundle == nil {
                BundlesListView(viewModel: BundlesListViewModel(repository: Repositories.bundleRepository))
                .transition(.asymmetric(
                    insertion: .move(edge: .leading),
                    removal: .move(edge: .leading)
                ))
            } else {
                BundleView(viewModel: BundleViewModel(of: $viewModel.selectedBundle, repository: Repositories.bundleRepository))
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .trailing)
                    ))
            }
        }
        .environment(viewModel)
    }
}

#Preview {
    BundlesNavigationView(viewModel: BundlesNavigationViewModel())
}
