//
//  AddBundleModalViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 22/02/2024.
//

@testable import ShoppingBuddy
import XCTest

final class AddBundleModalViewModelTest: TestRequiresModelContextSync {
    var shoppingBundleRepository = ShoppingBundleRepositoryMock()
    var viewModel: AddBundleModalViewModel!

    @MainActor override func tearDownWithError() throws {
        viewModel = nil
        shoppingBundleRepository.resetInvocations()
        cleanupStorage()
    }

    @MainActor func testShouldAddItemsFromBundleAndResetSelected() throws {
        // Given
        let shoppingList = ShoppingList(name: "a list")
        syncWithModelContext(shoppingList)
        let bundles = [
            ShoppingBundle(name: "default"),
            ShoppingBundle(name: "a bundle", items: ["bread", "milk", "salad"])
        ]
        shoppingBundleRepository.whenGetAll = bundles
        viewModel = AddBundleModalViewModel(shoppingList: shoppingList, repository: shoppingBundleRepository)
        
        // When
        viewModel.selected = bundles[1]
        viewModel.addItems()
        
        // Then
        XCTAssertEqual(shoppingList.items.count, 3)
        XCTAssertEqual(
            shoppingList.items.map(\.content),
            ["bread", "milk", "salad"]
        )
        XCTAssertEqual(viewModel.selected, bundles[0])
    }
    
    @MainActor func testShouldNotAddDuplicatesFromBundle() throws {
        // Given
        let shoppingList = ShoppingList(name: "a list", items: [ListItem(content: "bread"), ListItem(content: "salad")])
        syncWithModelContext(shoppingList)
        let bundles = [
            ShoppingBundle(name: "default"),
            ShoppingBundle(name: "a bundle", items: ["bread", "milk", "salad"])
        ]
        shoppingBundleRepository.whenGetAll = bundles
        viewModel = AddBundleModalViewModel(shoppingList: shoppingList, repository: shoppingBundleRepository)
        
        // When
        viewModel.selected = bundles[1]
        viewModel.addItems()
        
        // Then
        XCTAssertEqual(shoppingList.items.count, 3)
        assertEqualInAnyOrder(
            shoppingList.items.map(\.content),
            ["bread", "milk", "salad"]
        )
    }
    
    @MainActor func testShouldNotAddAnythingWhenWholeDuplicates() throws {
        // Given
        let shoppingList = ShoppingList(name: "a list", items: [ListItem(content: "bread"), ListItem(content: "salad"), ListItem(content: "milk")])
        syncWithModelContext(shoppingList)
        let bundles = [
            ShoppingBundle(name: "default"),
            ShoppingBundle(name: "a bundle", items: ["bread", "milk", "salad"])
        ]
        shoppingBundleRepository.whenGetAll = bundles
        viewModel = AddBundleModalViewModel(shoppingList: shoppingList, repository: shoppingBundleRepository)
        
        // When
        viewModel.selected = bundles[1]
        viewModel.addItems()
        
        // Then
        XCTAssertEqual(shoppingList.items.count, 3)
        assertEqualInAnyOrder(
            shoppingList.items.map(\.content),
            ["bread", "milk", "salad"]
        )
    }
    
    func testShouldResetSelectedToTheFirstOption() throws {
        // Given
        let shoppingList = ShoppingList(name: "a list", items: [ListItem(content: "bread"), ListItem(content: "salad"), ListItem(content: "milk")])
        let bundles = [
            ShoppingBundle(name: "default"),
            ShoppingBundle(name: "a bundle", items: ["bread", "milk", "salad"])
        ]
        shoppingBundleRepository.whenGetAll = bundles
        viewModel = AddBundleModalViewModel(shoppingList: shoppingList, repository: shoppingBundleRepository)
        
        // When
        viewModel.selected = bundles[1]
        viewModel.reset()
        
        // Then
        XCTAssertEqual(viewModel.selected, bundles[0])
    }
    
    func testShouldFallbackToNoneWhenNoBundlesInRepository() throws {
        // Given
        let shoppingList = ShoppingList(name: "a list", items: [ListItem(content: "bread"), ListItem(content: "salad"), ListItem(content: "milk")])
        shoppingBundleRepository.whenGetAll = []
        
        // When
        viewModel = AddBundleModalViewModel(shoppingList: shoppingList, repository: shoppingBundleRepository)
        
        // Then
        XCTAssertEqual(viewModel.selected, .none)
    }
}
