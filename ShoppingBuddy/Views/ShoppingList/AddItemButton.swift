//
//  AddItemButtonView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 15/12/2023.
//

import SwiftUI

struct AddItemButton: ToolbarContent {
    @Binding var isOpenModal: Bool
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(String(localized: "shoppingList.addItemButton")) {
                isOpenModal = true
            }
        }
    }
}
