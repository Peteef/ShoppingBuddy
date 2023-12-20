//
//  BundleViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 20/12/2023.
//

import Foundation

import Foundation
import SwiftUI

final class BundleViewModel: ObservableObject {
    private let repository: ShoppingBundleRepository = InMemoryRepository.bundleRepository

    @Published var bundle: ShoppingBundle
    @Published var isError: Bool = false
    
    @Binding var selected: ShoppingBundle?

    init(of: Binding<ShoppingBundle?>) {
        self._selected = of
        if let fromRepository = repository.get(id: of.wrappedValue!.id) {
            self.bundle = fromRepository
        } else {
            self.bundle = .none
            self.isError = true
        }
    }
}
