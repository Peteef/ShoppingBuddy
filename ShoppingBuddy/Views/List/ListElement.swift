//
//  ListElement.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import SwiftUI

struct ListElement: View {
    let shoppingList: ShoppingList
    
    @Binding var selectedList: ShoppingList?
    
    init(shoppingList: ShoppingList, selectedList: Binding<ShoppingList?>) {
        self.shoppingList = shoppingList
        self._selectedList = selectedList
    }
    
    var body: some View {
        HStack {
            Text(shoppingList.name)
        }
        .padding(.vertical, 10)
        .onTapGesture {
            selectedList = shoppingList
        }
    }
}

#Preview {
    ListElement(shoppingList: Mocks.shoppingLists[0], selectedList: .constant(nil))
}
