//
//  NewListModalView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import SwiftUI

struct NewItemModalView: View {
    @StateObject var viewModel: NewItemModalViewModel
    @Binding var isOpen: Bool

    @FocusState private var focusedNamTextField: Bool

    var body: some View {
        VStack {
            Spacer()
            TextField("What do you want to add?", text: $viewModel.content)
                .padding(.all, 15)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
                .focused($focusedNamTextField)
            Button("Create") {
                if viewModel.canAdd {
                    viewModel.addNewItem()
                    isOpen = false
                } else {
                    viewModel.showAlert = true
                }
            }
            .padding(.all, 15)
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .presentationDetents([.height(180)])
        .presentationDragIndicator(.visible)
        .presentationBackground(Color(.systemGray3))
        .onAppear {
            focusedNamTextField = true
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text("Item cannot be empty!"))
        }
    }
}

#Preview {
    NewItemModalView(viewModel: NewItemModalViewModel(shoppingList: .constant(Mocks.shoppingList), onUpdate: {}), isOpen: .constant(true))
}
