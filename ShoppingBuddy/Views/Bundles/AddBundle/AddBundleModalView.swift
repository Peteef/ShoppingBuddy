//
//  AddBundleModalView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import SwiftUI

struct AddBundleModalView: View {
    @StateObject var viewModel: AddBundleModalViewModel
    @Binding var isOpen: Bool

    var body: some View {
        VStack {
            Spacer()
            Picker(String(localized: "addBundle.title"), selection: $viewModel.selected) {
                ForEach(viewModel.bundles, id: \.self) { bundle in
                    Text(bundle.name).tag(bundle)
                }
            }
            Button(String(localized: "addBundle.addItemsButton")) {
                viewModel.addItems()
                isOpen = false
            }
            .padding(.all, 16)
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .presentationDetents([.height(180)])
        .presentationDragIndicator(.visible)
        .presentationBackground(Color(.systemGray3))
        // TODO: add confirmation
    }
}

#Preview {
    AddBundleModalView(viewModel: AddBundleModalViewModel(shoppingList: .constant(Mocks.shoppingList), onUpdate: { print("Updated") } ), isOpen: .constant(true))
}
