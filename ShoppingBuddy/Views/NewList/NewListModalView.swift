//
//  NewListModalView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import SwiftUI

struct NewListModalView: View {
    @StateObject var viewModel: NewListModalViewModel
    @Binding var isOpen: Bool

    var body: some View {
        VStack {
            Spacer()
            TextField("Type a list name...", text: $viewModel.name)
                .padding(.all, 15)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled()
            Button("Create") {
                if viewModel.canAdd {
                    viewModel.addNewList()
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
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text("List name cannot be empty!"))
        }
    }
}

#Preview {
    NewListModalView(viewModel: NewListModalViewModel(), isOpen: .constant(true))
}
