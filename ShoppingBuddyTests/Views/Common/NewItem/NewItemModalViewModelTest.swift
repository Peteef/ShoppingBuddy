//
//  NewItemModalViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 08/02/2024.
//

@testable import ShoppingBuddy
import XCTest

final class NewItemModalViewModelTest: XCTestCase {
    var viewModel: NewItemModalViewModel<TestContainingItems>!

    override func setUpWithError() throws {
        viewModel = NewItemModalViewModel(containingItems: TestContainingItems(), createItem: { $0 })
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testItShouldAllowToAddItem() {
        // Given
        viewModel.content = "an item"
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testItShouldNotAllowToAddItemWhenContentIsEmpty() {
        // Given
        viewModel.content = ""
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testItShouldNotAllowToAddItemWhenContentIsBlank() {
        // Given
        viewModel.content = "      "
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testItShouldAddItem() {
        // Given
        viewModel.content = "an item"
        
        // When
        viewModel.addNewItem()
        
        // Then
        XCTAssertEqual(viewModel.containingItems.items.count, 1)
        XCTAssertEqual(viewModel.containingItems.items[0], "an item")
    }
    
    func testItShouldNotAddNotAllowedItem() {
        // Given
        viewModel.content = ""
        XCTAssertFalse(viewModel.canAdd)
        
        // When
        viewModel.addNewItem()
        
        // Then
        XCTAssert(viewModel.containingItems.items.isEmpty)
    }
    
    func testItShouldTrimBeforeAddingItem() {
        // Given
        viewModel.content = "   an item "
        
        // When
        viewModel.addNewItem()
        
        // Then
        XCTAssertEqual(viewModel.containingItems.items.count, 1)
        XCTAssertEqual(viewModel.containingItems.items[0], "an item")
    }
    
    func testItShouldClearContentAfterAddingItem() {
        // Given
        viewModel.content = "an item"
        
        // When
        viewModel.addNewItem()
        
        // Then
        XCTAssertEqual(viewModel.containingItems.items.count, 1)
        XCTAssert(viewModel.content.isEmpty)
    }
    
    func testitShouldClearContentAfterReset() {
        // Given
        viewModel.content = "an item"
        
        // When
        viewModel.reset()
        
        // Then
        XCTAssert(viewModel.content.isEmpty)
    }
    
    class TestContainingItems: ContainingItems {
        typealias I = String
        
        var items: [String] = []
    }
}
