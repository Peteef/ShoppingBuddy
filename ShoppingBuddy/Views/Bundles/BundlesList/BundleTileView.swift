//
//  BundleTileView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import SwiftUI

struct BundleTileView: View {
    @Environment(BundlesNavigationViewModel.self) var viewModel: BundlesNavigationViewModel
    
    let of: ShoppingBundle
    
    var body: some View {
        Button(action: {
            withAnimation(.easeOut(duration: 0.4)) {
                viewModel.selectedBundle = of
            }
        }, label: {
            Text(of.name)
                .frame(width: 120, height: 120)
                .background(Color.accentColor)
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 4)
                .foregroundStyle(.white) // TODO: Make color dependent on scheme
                .font(.system(size: 16, weight: .heavy))
        })
    }
}

#Preview {
    BundleTileView(of: Mocks.bundle)
        .environment(BundlesNavigationViewModel())
}
