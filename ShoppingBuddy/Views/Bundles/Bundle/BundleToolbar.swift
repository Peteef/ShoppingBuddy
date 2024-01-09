//
//  BundleViewToolbar.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 09/01/2024.
//

import SwiftUI

struct BundleToolbar: View {
    @EnvironmentObject var viewModel: BundleViewModel
    
    var body: some View {
        HStack {
            Button(String(localized: "bundle.backButton"), systemImage: "chevron.backward") {
                withAnimation(.easeIn(duration: 0.2)) {
                    viewModel.selected = nil
                }
            }.padding()
            Spacer()
            RemoveBundleButton()
        }
    }
}

#Preview {
    BundleToolbar()
        .environmentObject(BundleViewModel(of: .constant(Mocks.bundle)))
}
