//
//  BundleUITest.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 22/03/2024.
//

import XCTest

final class BundleUITest: XCTestCase {
    let bundleName = "Test bundle - \(Date())"
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons[MainIdentifiers.bundleNavigation].tap()
        
        app.addFirstBundleButton().tap()
        app.textFields[BundleIdentifiers.newBundleNameInput].typeText(bundleName)
        app.buttons[BundleIdentifiers.createBundleButton].tap()
        app.listOfBundlesElement(bundleName).tap()
    }

    override func tearDownWithError() throws {
        app.buttons[BundleIdentifiers.removeBundleButton].tap()
        app.otherElements["Are you sure you want to remove this bundle?"].scrollViews.otherElements.buttons["Confirm"].tap()
        
        app.terminate()
        app = nil
    }
    
    func testShouldAddAndRemoveBundleElements() {
        // Given
        let itemOne = "bread"
        let itemTwo = "milk"
        let itemThree = "bananas"
        
        // When
        addItem(itemOne)
        
        // Then
        assertThat(app.bundleItem(itemOne).isHittable)
        
        // When
        addItem(itemTwo)
        addItem(itemThree)
        
        // Then
        assertThat(app.bundleItem(itemOne).isHittable)
        assertThat(app.bundleItem(itemTwo).isHittable)
        assertThat(app.bundleItem(itemThree).isHittable)
        
        // When
        removeItem(itemTwo)
        
        // Then
        assertThat(app.bundleItem(itemOne).isHittable)
        assertNot(app.bundleItem(itemTwo).exists)
        assertThat(app.bundleItem(itemThree).isHittable)
        
        // When
        removeItem(itemOne)
        removeItem(itemThree)
        
        // Then
        assertNot(app.bundleItem(itemOne).exists)
        assertNot(app.bundleItem(itemTwo).exists)
        assertNot(app.bundleItem(itemThree).exists)
    }
    
    private func addItem(_ content: String) {
        app.buttons[BundleIdentifiers.addBundleItemButton].tap()
        app.textFields[BundleIdentifiers.newItemContentInput].typeText(content)
        app.buttons[BundleIdentifiers.createItemButton].tap()
    }
    
    private func removeItem(_ content: String) {
        app.bundleItem(content).swipeLeft()
        app.collectionViews.buttons["Delete"].tap()
    }
}
