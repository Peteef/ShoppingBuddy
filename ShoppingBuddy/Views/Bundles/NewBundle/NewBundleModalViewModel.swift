//
//  NewBundleModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 28/12/2023.
//

import Foundation
import SwiftUI

@Observable
final class NewBundleModalViewModel {
    @ObservationIgnored
    private let repository: ShoppingBundleRepository
    
    var name: String = ""
    var showAlert: Bool = false
    
    init(repository: ShoppingBundleRepository) {
        self.repository = repository
    }
    
    var canAdd: Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func addNewBundle() {
        // TODO: Add better error handling here
        guard canAdd else {
            return
        }
        
        repository.add(bundle: ShoppingBundle(name: name.trimmingCharacters(in: .whitespaces)))
        reset()
    }
    
    func reset() {
        name = ""
    }
}
