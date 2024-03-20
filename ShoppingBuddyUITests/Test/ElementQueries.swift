//
//  ElementQueries.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 19/03/2024.
//

import XCTest

extension XCUIApplication {
    func listOfShoppingListsElement(_ key: String) -> XCUIElement {
        return self.otherElements[MainIdentifiers.shoppingListTabView]
            .collectionViews
            .buttons[key]
    }
    
    func shoppingListBackButton() -> XCUIElement {
        return self.otherElements["shoppingListTabView"]
            .navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]
            .buttons["🛒 ShoppingBuddy"]
    }
    
    func shoppingListItem(_ key: String) -> XCUIElement {
        return self.otherElements["shoppingListTabView"]
            .collectionViews
            .switches[key]
    }
}


