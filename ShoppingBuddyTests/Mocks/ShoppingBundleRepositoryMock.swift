//
//  ShoppingBundleRepositoryMock.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 22/02/2024.
//

import Foundation
import SwiftData
@testable import ShoppingBuddy

final class ShoppingBundleRepositoryMock: Mock, ShoppingBundleRepository {
    var whenGetAll: [ShoppingBundle] = []
    var whenGet: ShoppingBundle? = nil
    
    var saved: [ShoppingBundle] = []
    
    func getAll() -> [ShoppingBundle] {
        register(#function)
        return whenGetAll
    }
    
    func get(id: PersistentIdentifier) -> ShoppingBundle? {
        register(#function)
        return whenGet
    }
    
    func add(bundle: ShoppingBundle) {
        register(#function)
        saved.append(bundle)
    }
    
    func remove(bundle: ShoppingBundle) {
        register(#function)
    }
    
    override func resetInvocations() {
        super.resetInvocations()
        saved = []
    }
}
