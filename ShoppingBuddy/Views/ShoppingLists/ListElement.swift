//
//  ListElement.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import SwiftUI

struct ListElement: View {
    let shoppingList: ShoppingList
    
    init(of: ShoppingList) {
        self.shoppingList = of
    }
    
    var body: some View {
        HStack {
            Text(shoppingList.name)
        }
        .padding(.vertical, 10)
        .onTapGesture {
            print(shoppingList.id) // TODO: Implement navigation
        }
    }
}

#Preview {
    ListElement(of: Mocks.shoppingLists[0])
}
