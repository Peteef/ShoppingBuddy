//
//  RemoveBundleButton.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import SwiftUI

struct RemoveBundleButton: View {
    @EnvironmentObject var viewModel: BundleViewModel

    @State var isOpenDialog: Bool = false

    var body: some View {
        Button(String(localized: "bundle.removeBundle"), systemImage: "trash", role: .destructive) {
            isOpenDialog = true
        }.confirmationDialog("bundle.removeBundle.confirmation", isPresented: $isOpenDialog, titleVisibility: .visible) {
            Button(String(localized: "bundle.removeBundle.confirmButton"), role: .destructive) {
                viewModel.removeBundle()
                withAnimation(.easeIn(duration: 0.2)) {
                    viewModel.selected = nil
                }
            }
        }
        .padding()
    }
}

#Preview {
    RemoveBundleButton()
        .environmentObject(BundleViewModel(of: .constant(Mocks.bundle)))
}
