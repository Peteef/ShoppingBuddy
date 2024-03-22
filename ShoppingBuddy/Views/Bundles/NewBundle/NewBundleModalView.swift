//
//  NewBundleModalView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 28/12/2023.
//

import SwiftUI

struct NewBundleModalView: View {
    @State var viewModel: NewBundleModalViewModel
    @Binding var isOpen: Bool

    @FocusState private var focusedBundleTextField: Bool

    var body: some View {
        VStack {
            Spacer()
            TextField(String(localized: "newBundle.namePlaceholder"), text: $viewModel.name)
                .padding(.all, 16)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
                .focused($focusedBundleTextField)
                .accessibilityIdentifier("newBundleNameInput")
            Button(String(localized: "newBundle.createButton")) {
                if viewModel.canAdd {
                    viewModel.addNewBundle()
                    isOpen = false
                } else {
                    viewModel.showAlert = true
                }
            }
            .padding(.all, 16)
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier("createBundleButton")
            Spacer()
        }
        .presentationDetents([.height(180)])
        .presentationDragIndicator(.visible)
        .presentationBackground(Color(.systemGray3))
        .onAppear {
            focusedBundleTextField = true
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("newBundle.emptyNameAlert.title"),
                message: Text("newBundle.emptyNameAlert.body")
            )
        }
    }
}

#Preview {
    NewBundleModalView(viewModel: NewBundleModalViewModel(repository: Repositories.bundleRepository), isOpen: .constant(true))
}
