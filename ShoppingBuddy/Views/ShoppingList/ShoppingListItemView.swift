//
//  ShoppingListItemView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 15/12/2023.
//

import SwiftUI

struct ShoppingListItemView: View {
    @Binding var item: ListItem
    
    let onToggle: () -> Void
    
    var body: some View {
        Toggle(isOn: $item.checked, label: {
            Text(item.content)
        }).onChange(of: item.checked) {
            onToggle()
        }
    }
}

#Preview {
    ShoppingListItemView(item: .constant(Mocks.item), onToggle: {})
}
