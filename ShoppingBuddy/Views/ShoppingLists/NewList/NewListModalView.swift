//
//  NewListModalView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import SwiftUI

struct NewListModalView: View {
    @State var viewModel: NewListModalViewModel
    @Binding var isOpen: Bool

    @FocusState private var focusedNameTextField: Bool

    var body: some View {
        VStack {
            Spacer()
            TextField(String(localized: "newList.namePlaceholder"), text: $viewModel.name)
                .padding(.all, 16)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
                .focused($focusedNameTextField)
            Button(String(localized: "newList.createButton")) {
                if viewModel.canAdd {
                    viewModel.addNewList()
                    isOpen = false
                } else {
                    viewModel.showAlert = true
                }
            }
            .padding(.all, 16)
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .presentationDetents([.height(180)])
        .presentationDragIndicator(.visible)
        .presentationBackground(Color(.systemGray3))
        .onAppear {
            focusedNameTextField = true
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("newList.emptyNameAlert.title"),
                message: Text("newList.emptyNameAlert.body")
            )
        }
    }
}

#Preview {
    NewListModalView(viewModel: NewListModalViewModel(), isOpen: .constant(true))
}
