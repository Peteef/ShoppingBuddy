//
//  NewBundleModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 28/12/2023.
//

import Foundation
import SwiftUI

final class NewBundleModalViewModel: ObservableObject {
    private let repository: ShoppingBundleRepository = InMemoryRepository.bundleRepository
    
    @Published var name: String = ""
    @Published var showAlert: Bool = false
    
    var canAdd: Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func addNewBundle() {
        // TODO: Add better error handling here
        guard canAdd else {
            return
        }
        
        try? repository.add(bundle: ShoppingBundle(name: name.trimmingCharacters(in: .whitespaces)))
        reset()
    }
    
    func reset() {
        name = ""
    }
}
