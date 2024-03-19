//
//  ShoppingListUITest.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 19/03/2024.
//

import XCTest

final class ShoppingListUITest: XCTestCase {
    let shoppingListName = "Test list - \(Date())"
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons[MainIdentifiers.shoppingListNavigation].tap()
        
        app.listOfShoppingListsElement(ShoppingListIdentifiers.createShoppingListRow).tap()
        app.textFields[ShoppingListIdentifiers.newShoppingListNameInput].typeText(shoppingListName)
        app.buttons[ShoppingListIdentifiers.createShoppingListButton].tap()
        app.listOfShoppingListsElement(shoppingListName).tap()
    }

    override func tearDownWithError() throws {
        app.shoppingListBackButton().tap()
        app.listOfShoppingListsElement(shoppingListName).swipeLeft()
        app.otherElements["shoppingListTabView"].collectionViews.buttons["Delete"].tap()
        
        app.terminate()
        app = nil
    }

    func testShouldAddAndRemoveListElements() {
        // Given
        let itemOne = "bread"
        let itemTwo = "milk"
        let itemThree = "bananas"
        
        // When
        addItem(itemOne)
        
        // Then
        assertThat(app.shoppingListItem(itemOne).isHittable)
        
        // When
        addItem(itemTwo)
        addItem(itemThree)
        
        // Then
        assertThat(app.shoppingListItem(itemOne).isHittable)
        assertThat(app.shoppingListItem(itemTwo).isHittable)
        assertThat(app.shoppingListItem(itemThree).isHittable)
        
        // When
        removeItem(itemTwo)
        
        // Then
        assertThat(app.shoppingListItem(itemOne).isHittable)
        assertNot(app.shoppingListItem(itemTwo).exists)
        assertThat(app.shoppingListItem(itemThree).isHittable)
        
        // When
        removeItem(itemOne)
        removeItem(itemThree)
        
        // Then
        assertNot(app.shoppingListItem(itemOne).exists)
        assertNot(app.shoppingListItem(itemTwo).exists)
        assertNot(app.shoppingListItem(itemThree).exists)
    }
    
    private func addItem(_ content: String) {
        app.buttons[ShoppingListIdentifiers.addItemButton].tap()
        app.textFields[ShoppingListIdentifiers.newItemContentInput].typeText(content)
        app.buttons[ShoppingListIdentifiers.createItemButton].tap()
    }
    
    private func removeItem(_ content: String) {
        app.shoppingListItem(content).swipeLeft()
        app.otherElements["shoppingListTabView"].collectionViews.buttons["Delete"].tap()
    }
}
