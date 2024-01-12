//
//  RemoveBundleButton.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import SwiftUI

struct RemoveBundleButton: View {
    @Environment(BundlesNavigationViewModel.self) var navigationViewModel: BundlesNavigationViewModel
    @Environment(BundleViewModel.self) var viewModel: BundleViewModel

    @State var isOpenDialog: Bool = false

    var body: some View {
        Button(String(localized: "bundle.removeBundle"), systemImage: "trash", role: .destructive) {
            isOpenDialog = true
        }.confirmationDialog("bundle.removeBundle.confirmation", isPresented: $isOpenDialog, titleVisibility: .visible) {
            Button(String(localized: "bundle.removeBundle.confirmButton"), role: .destructive) {
                viewModel.removeBundle()
                withAnimation(.easeIn(duration: 0.2)) {
                    navigationViewModel.selectedBundle = nil
                }
            }
        }
        .padding()
    }
}

#Preview {
    RemoveBundleButton()
        .environment(BundleViewModel(of: .constant(Mocks.bundle)))
}
