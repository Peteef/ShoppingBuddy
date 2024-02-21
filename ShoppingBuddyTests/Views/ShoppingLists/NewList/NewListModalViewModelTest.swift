//
//  NewListModalViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 22/02/2024.
//

import XCTest
@testable import ShoppingBuddy

final class NewListModalViewModelTest: XCTestCase {
    var shoppingListRepository = ShoppingListRepositoryMock()
    var viewModel: NewListModalViewModel!

    override func setUpWithError() throws {
        viewModel = NewListModalViewModel(repository: shoppingListRepository)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        shoppingListRepository.resetInvocations()
    }

    func testItShouldAllowToAddList() {
        // Given
        viewModel.name = "a list"
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testItShouldNotAllowToAddListWhenNameIsEmpty() {
        // Given
        viewModel.name = ""
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testItShouldNotAllowToAddListWhenNameIsBlank() {
        // Given
        viewModel.name = "      "
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testItShouldAddList() {
        // Given
        viewModel.name = "a list"
        
        // When
        viewModel.addNewList()
        
        // Then
        XCTAssert(shoppingListRepository.wasCalled(name: "add(shoppingList:)"))
        XCTAssert(shoppingListRepository.saved.contains { $0.name == "a list" })
    }
    
    func testItShouldNotAddNotAllowedItem() {
        // Given
        viewModel.name = ""
        XCTAssertFalse(viewModel.canAdd)
        
        // When
        viewModel.addNewList()
        
        // Then
        XCTAssert(shoppingListRepository.wasNotCalled(name: "add(shoppingList:)"))
        XCTAssert(shoppingListRepository.saved.isEmpty)
    }
    
    func testItShouldTrimBeforeAddingItem() {
        // Given
        viewModel.name = "   a list "
        
        // When
        viewModel.addNewList()
        
        // Then
        XCTAssert(shoppingListRepository.saved.contains { $0.name == "a list" })
    }
    
    func testItShouldClearNameAfterAddingList() {
        // Given
        viewModel.name = "a list"
        
        // When
        viewModel.addNewList()
        
        // Then
        XCTAssert(shoppingListRepository.wasCalled(name: "add(shoppingList:)"))
        XCTAssert(viewModel.name.isEmpty)
    }
    
    func testitShouldClearNameAfterReset() {
        // Given
        viewModel.name = "a list"
        
        // When
        viewModel.reset()
        
        // Then
        XCTAssert(viewModel.name.isEmpty)
    }

}
