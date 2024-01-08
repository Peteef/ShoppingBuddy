//
//  AddBundleButton.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import SwiftUI

struct AddBundleButton: View {
    @Binding var isOpenModal: Bool
    
    var body: some View {
        Button(String(localized: "shoppingList.addBundleButton")) {
            isOpenModal = true
        }
    }
}
