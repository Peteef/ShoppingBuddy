//
//  BundleListUITest.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 22/03/2024.
//

import XCTest

final class BundleListUITest: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons[MainIdentifiers.bundleNavigation].tap()
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }

    func testShouldCreateAndDeleteBundle() {
        // Given
        let name = "Test bundle - \(Date())"
                
        // When
        addFirstBundle(name)
        
        // Then
        assertThat(app.listOfBundlesElement(name).exists)
                
        // When
        removeBundle(name)
        
        // Then
        assertNot(app.listOfBundlesElement(name).exists)
    }
    
    func testShouldHandleMultipleBundles() {
        // Given
        let nameOne = "Test bundle one - \(Date())"
        let nameTwo = "Test bundle two - \(Date())"
                
        // When
        addFirstBundle(nameOne)
        
        // Then
        assertThat(app.listOfBundlesElement(nameOne).exists)
        
        // When
        addBundle(nameTwo)
        
        // Then
        assertThat(app.listOfBundlesElement(nameOne).exists)
                
        // When
        removeBundle(nameOne)
        
        // Then
        assertNot(app.listOfBundlesElement(nameOne).exists)
        assertThat(app.listOfBundlesElement(nameTwo).exists)
        
        // When
        waitForAppSync(2)
        removeBundle(nameTwo)
        
        // Then
        assertNot(app.listOfBundlesElement(nameOne).exists)
        assertNot(app.listOfBundlesElement(nameTwo).exists)
    }
    
    private func addFirstBundle(_ name: String) {
        app.addFirstBundleButton().tap()
        app.textFields[BundleIdentifiers.newBundleNameInput].typeText(name)
        app.buttons[BundleIdentifiers.createBundleButton].tap()
    }
    
    private func addBundle(_ name: String) {
        app.addBundleTile().tap()
        app.textFields[BundleIdentifiers.newBundleNameInput].typeText(name)
        app.buttons[BundleIdentifiers.createBundleButton].tap()
    }
    
    private func removeBundle(_ name: String) {
        app.listOfBundlesElement(name).tap()
        app.buttons[BundleIdentifiers.removeBundleButton].tap()
        app.otherElements["Are you sure you want to remove this bundle?"].scrollViews.otherElements.buttons["Confirm"].tap()
    }
    
    private func waitForAppSync(_ seconds: UInt32) {
        sleep(seconds)
    }
}
