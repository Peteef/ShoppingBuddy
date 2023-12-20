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
            } else {
                Text(viewModel.selectedBundle!.name)
            }
        }
    }
}

#Preview {
    BundlesNavigationView(viewModel: BundlesNavigationViewModel())
}
