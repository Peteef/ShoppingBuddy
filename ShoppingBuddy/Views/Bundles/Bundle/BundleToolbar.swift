//
//  BundleViewToolbar.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 09/01/2024.
//

import SwiftUI

struct BundleToolbar: View {
    @Environment(BundlesNavigationViewModel.self) var viewModel: BundlesNavigationViewModel
    
    var body: some View {
        HStack {
            Button(String(localized: "bundle.backButton"), systemImage: "chevron.backward") {
                withAnimation(.easeIn(duration: 0.2)) {
                    viewModel.selectedBundle = nil
                }
            }.padding()
            Spacer()
            RemoveBundleButton()
                .accessibilityIdentifier("removeBundleButton")
        }
    }
}

#Preview {
    BundleToolbar()
        .environment(BundlesNavigationViewModel())
}
