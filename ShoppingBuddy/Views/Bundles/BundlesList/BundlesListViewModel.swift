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
    private let repository = Repositories.bundleRepository

    var bundles: [ShoppingBundle] = []
    var isLoading: Bool = false
    
    var isOpenNewBundleModal: Bool = false
    
    init() {
        load()
    }

    func load() {
        isLoading = true
        bundles = repository.getAll()
        isLoading = false
    }
}
