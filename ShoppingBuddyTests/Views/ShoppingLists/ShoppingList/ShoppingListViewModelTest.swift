//
//  ShoppingListViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 21/02/2024.
//

import XCTest
@testable import ShoppingBuddy

final class ShoppingListViewModelTest: TestRequiresModelContextSync {
    var shoppingListRepository = ShoppingListRepositoryMock()
    var viewModel: ShoppingListViewModel!

    override func tearDownWithError() throws {
        viewModel = nil
        shoppingListRepository.resetInvocations()
    }

    func testShouldLoadFromRepository() {
        // Given
        let list = ShoppingList(name: "test list")
        shoppingListRepository.whenGet = list
        
        // When
        viewModel = ShoppingListViewModel(of: list, repository: shoppingListRepository)
        
        // Then
        XCTAssert(shoppingListRepository.wasCalled(name: "get(id:)"))
        XCTAssertEqual(viewModel.shoppingList, list)
        XCTAssertFalse(viewModel.isError)
    }
    
    func testShouldFallbackWithErrorWhenListNotInRepository() {
        // Given
        let list = ShoppingList(name: "test list")
        shoppingListRepository.whenGet = nil
        
        // When
        viewModel = ShoppingListViewModel(of: list, repository: shoppingListRepository)
        
        // Then
        XCTAssert(shoppingListRepository.wasCalled(name: "get(id:)"))
        XCTAssertEqual(viewModel.shoppingList, .none)
        XCTAssertTrue(viewModel.isError)
    }
    
    @MainActor func testShouldRemoveMultipleItems() async {
        // Given
        let list = ShoppingList(name: "test list", items: [
            ListItem(content: "item 1"),
            ListItem(content: "item 2"),
            ListItem(content: "item 3"),
            ListItem(content: "item 4")
        ])
        shoppingListRepository.whenGet = list
        viewModel = ShoppingListViewModel(of: list, repository: shoppingListRepository)
        syncWithModelContext(list)
        
        // When
        viewModel.removeItems(at: IndexSet(arrayLiteral: 1, 2))
        
        // Then
        XCTAssertEqual(
            viewModel.shoppingList.items.map(\.content),
            ["item 1", "item 4"]
        )
    }
    
    @MainActor func testShouldRemoveCheckedItems() async {
        // Given
        let list = ShoppingList(name: "test list", items: [
            ListItem(content: "item 1"),
            ListItem(content: "item 2", checked: true),
            ListItem(content: "item 3"),
            ListItem(content: "item 4", checked: true)
        ])
        shoppingListRepository.whenGet = list
        viewModel = ShoppingListViewModel(of: list, repository: shoppingListRepository)
        syncWithModelContext(list)
        
        // When
        viewModel.removeCheckedItems()
        
        // Then
        XCTAssertEqual(
            viewModel.shoppingList.items.map(\.content),
            ["item 1", "item 3"]
        )
    }
    
    @MainActor func testShouldRemoveNothingWhenNoItemIsChecked() async {
        // Given
        let list = ShoppingList(name: "test list", items: [
            ListItem(content: "item 1"),
            ListItem(content: "item 2"),
            ListItem(content: "item 3"),
            ListItem(content: "item 4")
        ])
        shoppingListRepository.whenGet = list
        viewModel = ShoppingListViewModel(of: list, repository: shoppingListRepository)
        syncWithModelContext(list)
        
        // When
        viewModel.removeCheckedItems()
        
        // Then
        XCTAssertEqual(
            viewModel.shoppingList.items.map(\.content),
            ["item 1", "item 2", "item 3", "item 4"]
        )
    }
}
