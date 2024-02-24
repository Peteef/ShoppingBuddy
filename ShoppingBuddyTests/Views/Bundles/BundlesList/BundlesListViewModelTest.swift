//
//  BundlesListViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 24/02/2024.
//

import XCTest
@testable import ShoppingBuddy

final class BundlesListViewModelTest: XCTestCase {

    var shoppingBundleRepository = ShoppingBundleRepositoryMock()
    var viewModel: BundlesListViewModel!
    
    override func setUpWithError() throws {
        viewModel = BundlesListViewModel(repository: shoppingBundleRepository)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        shoppingBundleRepository.resetInvocations()
    }

    func testShouldLoadUsingRepository() {
        // Given
        shoppingBundleRepository.resetInvocations() // Ignore initial load
        let all = [ShoppingBundle(name: "test bundle")]
        shoppingBundleRepository.whenGetAll = all
        
        // When
        viewModel.load()
        
        // Then
        XCTAssert(shoppingBundleRepository.wasCalled(name: "getAll()"))
        XCTAssertEqual(viewModel.bundles, all)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testShouldLoadOnInit() {
        // Given
        shoppingBundleRepository.resetInvocations() // Ignore initial load
        let all = [ShoppingBundle(name: "test bundle")]
        shoppingBundleRepository.whenGetAll = all
        
        // When
        viewModel = BundlesListViewModel(repository: shoppingBundleRepository)
        
        // Then
        XCTAssert(shoppingBundleRepository.wasCalled(name: "getAll()"))
        XCTAssertEqual(viewModel.bundles, all)
    }

}
