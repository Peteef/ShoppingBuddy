//
//  AddItemButton.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 15/12/2023.
//

import SwiftUI

struct AddItemButton: View {
    @Binding var isOpenModal: Bool
    
    var body: some View {
        Button(String(localized: "shoppingList.addItemButton")) {
            isOpenModal = true
        }
    }
}
