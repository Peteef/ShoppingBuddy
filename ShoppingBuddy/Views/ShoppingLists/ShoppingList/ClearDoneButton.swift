//
//  ClearDoneButton.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 15/12/2023.
//

import SwiftUI

struct ClearDoneButton: View {
    @Environment(ShoppingListViewModel.self) var viewModel: ShoppingListViewModel

    @State var isOpenDialog: Bool = false

    var body: some View {
        Button(String(localized: "shoppingList.clearDoneButton")) {
            isOpenDialog = true
        }.confirmationDialog("shoppingList.clearDone.confirmation", isPresented: $isOpenDialog, titleVisibility: .visible) {
            Button(String(localized: "shoppingList.clearDone.confirmButton"), role: .destructive, action: viewModel.removeCheckedItems)
        }
    }
}
