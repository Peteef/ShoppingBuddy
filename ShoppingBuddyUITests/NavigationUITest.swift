//
//  NavigationUITests.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 19/03/2024.
//

import XCTest

final class NavigationUITest: XCTestCase {
    func testNavigateTabs() {
        // Given
        let app = XCUIApplication()
        app.launch()
        
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
