//
//  RemoveBundleButton.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import SwiftUI

struct RemoveBundleButton: View {
    let onRemove: () -> Void

    @State var isOpenDialog: Bool = false

    var body: some View {
        Button(String(localized: "bundle.removeBundle"), systemImage: "trash", role: .destructive) {
            isOpenDialog = true
        }.confirmationDialog("bundle.removeBundle.confirmation", isPresented: $isOpenDialog, titleVisibility: .visible) {
            Button(String(localized: "bundle.removeBundle.confirmButton"), role: .destructive, action: onRemove)
        }
        .padding()
    }
}
