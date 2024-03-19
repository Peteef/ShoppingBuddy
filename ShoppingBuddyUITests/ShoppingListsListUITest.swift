//
//  ShoppingListsListUITest.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 19/03/2024.
//

import XCTest

final class ShoppingListsListUITest: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons[MainIdentifiers.shoppingListNavigation].tap()
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }
    
    func testShouldCreateAndDeleteShoppingList() {
        // Given
        let name = "Test list - \(Date())"
                
        // When
        addList(name)
        
        // Then
        assertThat(app.listOfShoppingListsElement(name).exists)
                
        // When
        removeList(name)
        
        // Then
        assertNot(app.listOfShoppingListsElement(name).exists)
    }
    
    func testShouldHandleMultipleShoppingLists() {
        // Given
        let nameOne = "Test list one - \(Date())"
        let nameTwo = "Test list two - \(Date())"
                
        // When
        addList(nameOne)
        
        // Then
        assertThat(app.listOfShoppingListsElement(nameOne).exists)
        
        // When
        addList(nameTwo)
        
        // Then
        assertThat(app.listOfShoppingListsElement(nameOne).exists)
                
        // When
        removeList(nameOne)
        
        // Then
        assertNot(app.listOfShoppingListsElement(nameOne).exists)
        assertThat(app.listOfShoppingListsElement(nameTwo).exists)
        
        // When
        removeList(nameTwo)
        
        // Then
        assertNot(app.listOfShoppingListsElement(nameOne).exists)
        assertNot(app.listOfShoppingListsElement(nameTwo).exists)
    }
    
    private func addList(_ name: String) {
        app.listOfShoppingListsElement(ShoppingListIdentifiers.createShoppingListRow).tap()
        app.textFields[ShoppingListIdentifiers.newShoppingListNameInput].typeText(name)
        app.buttons[ShoppingListIdentifiers.createShoppingListButton].tap()
    }
    
    private func removeList(_ name: String) {
        app.listOfShoppingListsElement(name).swipeLeft()
        app.otherElements["shoppingListTabView"].collectionViews.buttons["Delete"].tap()
    }
}
