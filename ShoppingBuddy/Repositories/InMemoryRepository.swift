//
//  InMemoryRepository.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

import Foundation

enum InMemoryRepository {
    public static let bundleRepository: ShoppingBundleRepository = InMemoryShoppingBundleRepository()
}
