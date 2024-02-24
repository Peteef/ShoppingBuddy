//
//  BundleViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 25/02/2024.
//

import XCTest
@testable import ShoppingBuddy

final class BundleViewModelTest: TestRequiresModelContextSync {
    var shoppingBundleRepository = ShoppingBundleRepositoryMock()
    var viewModel: BundleViewModel!

    override func tearDownWithError() throws {
        viewModel = nil
        shoppingBundleRepository.resetInvocations()
    }

    func testShouldLoadFromRepository() {
        // Given
        let bundle = ShoppingBundle(name: "test bundle")
        shoppingBundleRepository.whenGet = bundle
        
        // When
        viewModel = BundleViewModel(of: .constant(bundle), repository: shoppingBundleRepository)
        
        // Then
        XCTAssert(shoppingBundleRepository.wasCalled(name: "get(id:)"))
        XCTAssertEqual(viewModel.bundle, bundle)
        XCTAssertFalse(viewModel.isError)
    }
    
    func testShouldFallbackWithErrorWhenBindleNotInRepository() {
        // Given
        let bundle = ShoppingBundle(name: "test bundle")
        shoppingBundleRepository.whenGet = nil
        
        // When
        viewModel = BundleViewModel(of: .constant(bundle), repository: shoppingBundleRepository)
        
        // Then
        XCTAssert(shoppingBundleRepository.wasCalled(name: "get(id:)"))
        XCTAssertEqual(viewModel.bundle, .none)
        XCTAssertTrue(viewModel.isError)
    }
    
    func testShouldFallbackWithErrorWhenBindleIsNil() {
        // Given
        shoppingBundleRepository.whenGet = nil
        
        // When
        viewModel = BundleViewModel(of: .constant(nil), repository: shoppingBundleRepository)
        
        // Then
        XCTAssert(shoppingBundleRepository.wasNotCalled(name: "get(id:)"))
        XCTAssertEqual(viewModel.bundle, .none)
        XCTAssertTrue(viewModel.isError)
    }
    
    @MainActor func testShouldRemoveBundle() async {
        // Given
        let bundle = ShoppingBundle(name: "test bundle")
        shoppingBundleRepository.whenGet = bundle
        viewModel = BundleViewModel(of: .constant(bundle), repository: shoppingBundleRepository)
        syncWithModelContext(bundle)
        
        // When
        viewModel.removeBundle()
        
        // Then
        XCTAssert(shoppingBundleRepository.wasCalled(name: "remove(bundle:)"))
    }
    
    @MainActor func testShouldRemoveMultipleItems() async {
        // Given
        let bundle = ShoppingBundle(name: "test list", items: [
            "item 1",
            "item 2",
            "item 3",
            "item 4"
        ])
        shoppingBundleRepository.whenGet = bundle
        viewModel = BundleViewModel(of: .constant(bundle), repository: shoppingBundleRepository)
        syncWithModelContext(bundle)
        
        // When
        viewModel.removeItems(at: IndexSet(arrayLiteral: 1, 2))
        
        // Then
        XCTAssertEqual(
            viewModel.bundle.items,
            ["item 1", "item 4"]
        )
    }
}
