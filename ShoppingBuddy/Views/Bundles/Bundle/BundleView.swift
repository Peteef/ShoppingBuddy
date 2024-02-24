//
//  BundleView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 20/12/2023.
//

import SwiftUI

struct BundleView: View {
    @State var viewModel: BundleViewModel

    var body: some View {
        VStack {
            BundleToolbar()
            Text(viewModel.bundle.name)
                .font(.system(size: 20, weight: .bold))
            List {
                ForEach(viewModel.bundle.items, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: viewModel.removeItems)
                Button(String(localized: "bundle.addItemButton"), systemImage: "plus.circle") {
                    viewModel.isOpenNewItemModal = true
                }
                .padding(.vertical, 4)
            }
            Spacer()
        }
        .environment(viewModel)
        .sheet(isPresented: $viewModel.isOpenNewItemModal, content: {
            NewItemModalView(
                viewModel: NewItemModalViewModel<ShoppingBundle>(
                    containingItems: viewModel.bundle,
                    createItem: { $0 }
                ),
                isOpen: $viewModel.isOpenNewItemModal
            )
        })
    }
}

#Preview {
    BundleView(viewModel: BundleViewModel(of: .constant(Mocks.bundle), repository: Repositories.bundleRepository))
}
