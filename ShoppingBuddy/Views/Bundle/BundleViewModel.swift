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
    
    @Published var isOpenNewItemModal: Bool = false
    
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
    
    func removeBundle() {
        repository.remove(id: bundle.id)
    }
    
    func removeItems(at: IndexSet) {
        bundle.items.remove(atOffsets: at)
        update()
    }
    
    func update() {
        do {
            try repository.update(bundle: bundle)
        } catch let BundleError.alreadyExist(withId) {
            print("Bundle with id: \(withId) does not exist!")
        } catch {
            print("Something went wrong.")
        }
    }
}
