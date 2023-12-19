//
//  BundleRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

protocol ShoppingBundleRepository {
    func getAll() -> [ShoppingBundle]
    func get(id: String) -> ShoppingBundle?
    func add(bundle: ShoppingBundle) throws
    func update(bundle: ShoppingBundle) throws
    func remove(id: String)
}
