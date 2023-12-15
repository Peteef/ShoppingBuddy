//
//  ListElement.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import SwiftUI

struct ListElementView: View {
    let shoppingList: ShoppingList

    init(of: ShoppingList) {
        self.shoppingList = of
    }

    var body: some View {
        HStack {
            Text(shoppingList.name)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ListElementView(of: Mocks.shoppingList)
}
