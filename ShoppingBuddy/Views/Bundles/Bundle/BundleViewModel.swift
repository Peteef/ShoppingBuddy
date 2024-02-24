//
//  BundleViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 20/12/2023.
//

import Foundation

import Foundation
import SwiftUI

@Observable
final class BundleViewModel {
    @ObservationIgnored
    private let repository: ShoppingBundleRepository

    var bundle: ShoppingBundle
    var isError: Bool = false
    
    var isOpenNewItemModal: Bool = false

    init(of: Binding<ShoppingBundle?>, repository: ShoppingBundleRepository) {
        self.repository = repository
        if let fromRepository = of.wrappedValue != nil ? repository.get(id: of.wrappedValue!.id) : nil {
            self.bundle = fromRepository
        } else {
            self.bundle = .none
            self.isError = true
        }
    }
    
    func removeBundle() {
        repository.remove(bundle: bundle)
    }
    
    func removeItems(at: IndexSet) {
        bundle.items.remove(atOffsets: at)
    }
}
