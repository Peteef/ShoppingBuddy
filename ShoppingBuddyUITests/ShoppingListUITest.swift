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
        app.otherElements[MainIdentifiers.shoppingListTabView].collectionViews.buttons["Delete"].tap()
        
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
    
    func testShouldCheckItemsAndClearDone() {
        // Given
        let itemOne = "bread"
        let itemTwo = "milk"
        let itemThree = "bananas"
        
        // When
        addItem(itemOne)
        addItem(itemTwo)
        app.shoppingListItem(itemTwo).tap()
        
        // Then
        app.shoppingListItem(itemOne).assertUnchecked()
        app.shoppingListItem(itemTwo).assertChecked()
        
        // When
        addItem(itemThree)
        app.shoppingListItem(itemOne).tap()
        
        // Then
        app.shoppingListItem(itemOne).assertChecked()
        app.shoppingListItem(itemTwo).assertChecked()
        app.shoppingListItem(itemThree).assertUnchecked()
        
        // When
        app.shoppingListItem(itemThree).tap()
        
        // Then
        app.shoppingListItem(itemOne).assertChecked()
        app.shoppingListItem(itemTwo).assertChecked()
        app.shoppingListItem(itemThree).assertChecked()
        
        // When
        app.shoppingListItem(itemThree).tap()
        
        // Then
        app.shoppingListItem(itemOne).assertChecked()
        app.shoppingListItem(itemTwo).assertChecked()
        app.shoppingListItem(itemThree).assertUnchecked()
        
        // When
        app.buttons[ShoppingListIdentifiers.clearDoneButton].tap()
        app.scrollViews.otherElements.buttons["Confirm"].tap()
        
        // Then
        assertNot(app.shoppingListItem(itemOne).exists)
        assertNot(app.shoppingListItem(itemTwo).exists)
        assertThat(app.shoppingListItem(itemThree).exists)
        app.shoppingListItem(itemThree).assertUnchecked()
    }
    
    func testShouldAddItemsFromBundle() {
        // Given
        let itemOne = "bread"
        let itemTwo = "milk"
        let itemThree = "bananas"
        let bundleName = "Test bundle - \(Date())"
        
        // When
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons[MainIdentifiers.bundleNavigation].tap()
        
        app.addFirstBundleButton().tap()
        app.textFields[BundleIdentifiers.newBundleNameInput].typeText(bundleName)
        app.buttons[BundleIdentifiers.createBundleButton].tap()
        app.listOfBundlesElement(bundleName).tap()
        
        addBundleItem(itemOne)
        addBundleItem(itemTwo)
        addBundleItem(itemThree)
        
        // And
        tabBar.buttons[MainIdentifiers.shoppingListNavigation].tap()
        addItem(itemTwo)
        app.shoppingListItem(itemTwo).tap()
        
        // And
        addItemsFromBundle(bundleName)
        
        // Then
        app.shoppingListItem(itemOne).assertUnchecked()
        app.shoppingListItem(itemTwo).assertChecked()
        app.shoppingListItem(itemThree).assertUnchecked()
        
        // When
        app.buttons[ShoppingListIdentifiers.clearDoneButton].tap()
        app.scrollViews.otherElements.buttons["Confirm"].tap()
        
        // Then
        assertNot(app.shoppingListItem(itemTwo).exists)
        
        // When
        addItemsFromBundle(bundleName)
        
        // Then
        app.shoppingListItem(itemOne).assertUnchecked()
        app.shoppingListItem(itemTwo).assertUnchecked()
        app.shoppingListItem(itemThree).assertUnchecked()
                
        // And
        tabBar.buttons[MainIdentifiers.bundleNavigation].tap()
        app.buttons[BundleIdentifiers.removeBundleButton].tap()
        app.otherElements["Are you sure you want to remove this bundle?"].scrollViews.otherElements.buttons["Confirm"].tap()
        tabBar.buttons[MainIdentifiers.shoppingListNavigation].tap()
        
    }
    
    private func addItem(_ content: String) {
        app.buttons[ShoppingListIdentifiers.addItemButton].tap()
        app.textFields[ShoppingListIdentifiers.newItemContentInput].typeText(content)
        app.buttons[ShoppingListIdentifiers.createItemButton].tap()
    }
    
    private func removeItem(_ content: String) {
        app.shoppingListItem(content).swipeLeft()
        app.otherElements[MainIdentifiers.shoppingListTabView].collectionViews.buttons["Delete"].tap()
    }
    
    private func addBundleItem(_ content: String) {
        app.buttons[BundleIdentifiers.addBundleItemButton].tap()
        app.textFields[BundleIdentifiers.newItemContentInput].typeText(content)
        app.buttons[BundleIdentifiers.createItemButton].tap()
    }
    
    private func addItemsFromBundle(_ bundleName: String) {
        app.buttons[ShoppingListIdentifiers.addBundleButton].tap()
        // TODO: It should explicitely select a bundle
        assertThat(app.staticTexts[bundleName].exists)
        app.buttons[ShoppingListIdentifiers.addItemsFromBundleButton].tap()
    }
}
