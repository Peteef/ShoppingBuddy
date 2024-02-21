//
//  ListViewModelTest.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 08/02/2024.
//

@testable import ShoppingBuddy
import XCTest

final class ListViewModelTest: XCTestCase {
    var shoppingListRepository = ShoppingListRepositoryMock()
    var viewModel: ListViewModel!
    
    override func setUpWithError() throws {
        viewModel = ListViewModel(repository: shoppingListRepository)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        shoppingListRepository.resetInvocations()
    }

    func testShouldLoadUsingRepository() {
        // Given
        shoppingListRepository.resetInvocations() // Ignore initial load
        let all = [ShoppingList(name: "test list")]
        shoppingListRepository.whenGetAll = all
        
        // When
        viewModel.load()
        
        // Then
        XCTAssert(shoppingListRepository.wasCalled(name: "getAll()"))
        XCTAssertEqual(viewModel.shoppingLists, all)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testShouldLoadOnInit() {
        // Given
        shoppingListRepository.resetInvocations() // Ignore initial load
        let all = [ShoppingList(name: "test list")]
        shoppingListRepository.whenGetAll = all
        
        // When
        viewModel = ListViewModel(repository: shoppingListRepository)
        
        // Then
        XCTAssert(shoppingListRepository.wasCalled(name: "getAll()"))
        XCTAssertEqual(viewModel.shoppingLists, all)
    }
    
    func testShouldRemoveMultipleLists() {
        // Given
        let all = [
            ShoppingList(name: "test list"),
            ShoppingList(name: "other list"),
            ShoppingList(name: "another list"),
        ]
        shoppingListRepository.whenGetAll = all
        viewModel.load()
        
        // When
        viewModel.removeList(at: IndexSet(arrayLiteral: 0, 2))
        
        // Then
        XCTAssert(shoppingListRepository.wasCalled(name: "remove(shoppingList:)", times: 2))
        XCTAssertEqual(viewModel.shoppingLists.count, 1)
        XCTAssertEqual(viewModel.shoppingLists, [all[1]])
    }
}
