//
//  InMemoryShoppingBundleRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation

class InMemoryShoppingBundleRepository: ShoppingBundleRepository {
    
    private var data: [String: ShoppingBundle] = [:]
    
    init() {
        Mocks.bundles.forEach { bundle in
            data[bundle.id] = bundle
        }
    }
    
    func getAll() -> [ShoppingBundle] {
        Array(data.values).sorted {
            $0.name < $1.name
        }
    }
    
    func get(id: String) -> ShoppingBundle? {
        data[id]
    }
    
    func add(bundle: ShoppingBundle) throws {
        let id = bundle.id
        if data.keys.contains(id) {
            throw BundleError.alreadyExist(withId: id)
        }
        data[id] = bundle
    }
    
    func update(bundle: ShoppingBundle) throws {
        let id = bundle.id
        if !data.keys.contains(id) {
            throw BundleError.notExist(withId: id)
        }
        data[id] = bundle
    }
    
    func remove(id: String) {
        data.removeValue(forKey: id)
    }
}
