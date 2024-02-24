//
//  NewBundleModalViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 24/02/2024.
//

import XCTest
@testable import ShoppingBuddy

final class NewBundleModalViewModelTest: XCTestCase {
    
    var shoppingBundleRepository = ShoppingBundleRepositoryMock()
    var viewModel: NewBundleModalViewModel!

    override func setUpWithError() throws {
        viewModel = NewBundleModalViewModel(repository: shoppingBundleRepository)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        shoppingBundleRepository.resetInvocations()
    }

    func testItShouldAllowToAddBundle() {
        // Given
        viewModel.name = "a bundle"
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testItShouldNotAllowToAddItemWhenNameIsEmpty() {
        // Given
        viewModel.name = ""
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testItShouldNotAllowToAddItemWhenNameIsBlank() {
        // Given
        viewModel.name = "      "
        
        // When
        let result = viewModel.canAdd
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testItShouldAddBundle() {
        // Given
        viewModel.name = "a bundle"
        
        // When
        viewModel.addNewBundle()
        
        // Then
        XCTAssert(shoppingBundleRepository.wasCalled(name: "add(bundle:)"))
        XCTAssert(shoppingBundleRepository.saved.contains { $0.name == "a bundle" })
    }
    
    func testItShouldNotAddNotAllowedItem() {
        // Given
        viewModel.name = ""
        XCTAssertFalse(viewModel.canAdd)
        
        // When
        viewModel.addNewBundle()
        
        // Then
        XCTAssert(shoppingBundleRepository.wasNotCalled(name: "add(bundle:)"))
        XCTAssert(shoppingBundleRepository.saved.isEmpty)
    }
    
    func testItShouldTrimBeforeAddingBundle() {
        // Given
        viewModel.name = "   a bundle "
        
        // When
        viewModel.addNewBundle()
        
        // Then
        XCTAssert(shoppingBundleRepository.saved.contains { $0.name == "a bundle" })
    }
    
    func testItShouldClearContentAfterAddingBundle() {
        // Given
        viewModel.name = "a bundle"
        
        // When
        viewModel.addNewBundle()
        
        // Then
        XCTAssert(shoppingBundleRepository.wasCalled(name: "add(bundle:)"))
        XCTAssert(viewModel.name.isEmpty)
    }
    
    func testitShouldClearNameAfterReset() {
        // Given
        viewModel.name = "a bundle"
        
        // When
        viewModel.reset()
        
        // Then
        XCTAssert(viewModel.name.isEmpty)
    }

}
