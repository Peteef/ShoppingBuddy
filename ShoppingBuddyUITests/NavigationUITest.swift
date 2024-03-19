//
//  NavigationUITests.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 19/03/2024.
//

import XCTest

final class NavigationUITest: XCTestCase {
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
    
    func testShouldNavigateTabs() {
        // When
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons[MainIdentifiers.bundleNavigation].tap()
        
        // Then
        assertThat(app.otherElements[MainIdentifiers.bundleTabView].isHittable)
        assertNot(app.otherElements[MainIdentifiers.shoppingListTabView].isHittable)
        
        // When
        tabBar.buttons[MainIdentifiers.shoppingListNavigation].tap()
        
        // Then
        assertThat(app.otherElements[MainIdentifiers.shoppingListTabView].isHittable)
        assertNot(app.otherElements[MainIdentifiers.bundleTabView].isHittable)
    }

}
