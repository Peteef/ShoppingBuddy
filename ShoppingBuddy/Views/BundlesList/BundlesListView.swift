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
            if viewModel.bundles.isEmpty {
                EmptyBundlesListView()
            } else {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                    ForEach(viewModel.bundles, id: \.id) { bundle in
                        Button(action: {
                            print("Open \(bundle.name)")
                        }, label: {
                            Text(bundle.name)
                                .frame(width: 120, height: 120)
                                .background(Color.accentColor)
                                .clipShape(.rect(cornerRadius: 16))
                                .shadow(radius: 4)
                                .foregroundStyle(.white) // TODO: Make color dependent on scheme
                                .font(.system(size: 16, weight: .heavy))
                        })
                    }
                }
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
