//
//  ShoppingBundleRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 22/02/2024.
//

import Foundation
import SwiftData

protocol ShoppingBundleRepository {
    func getAll() -> [ShoppingBundle]
    func get(id: PersistentIdentifier) -> ShoppingBundle?
    func add(bundle: ShoppingBundle)
    func remove(bundle: ShoppingBundle)
}
