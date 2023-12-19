//
//  BundlesListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import Foundation

final class BundlesListViewModel: ObservableObject {
    private let repository: ShoppingBundleRepository = InMemoryRepository.bundleRepository

    @Published var bundles: [ShoppingBundle] = []
    @Published var isLoading: Bool = false

    func load() {
        isLoading = true
        bundles = repository.getAll()
        isLoading = false
    }
}
