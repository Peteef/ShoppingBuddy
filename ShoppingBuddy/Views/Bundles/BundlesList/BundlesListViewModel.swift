//
//  BundlesListViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 11/12/2023.
//

import Foundation
import SwiftUI

@Observable
final class BundlesListViewModel {
    @ObservationIgnored
    private let repository: ShoppingBundleRepository

    var bundles: [ShoppingBundle] = []
    var isLoading: Bool = false
    
    var isOpenNewBundleModal: Bool = false
    
    init(repository: ShoppingBundleRepository) {
        self.repository = repository
        load()
    }

    func load() {
        isLoading = true
        bundles = repository.getAll()
        isLoading = false
    }
}
