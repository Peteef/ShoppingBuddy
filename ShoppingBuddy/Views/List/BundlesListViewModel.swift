//
//  BundlesListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import Foundation
import SwiftUI

final class BundlesListViewModel: ObservableObject {
    private let repository: ShoppingBundleRepository = InMemoryRepository.bundleRepository

    @Published var bundles: [ShoppingBundle] = []
    @Published var isLoading: Bool = false

    @Binding var selectedBundle: ShoppingBundle?

    init(selectedBundle: Binding<ShoppingBundle?>) {
        self._selectedBundle = selectedBundle
    }

    func load() {
        isLoading = true
        bundles = repository.getAll()
        isLoading = false
    }
}
