//
//  NewListModalViewModel.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 13/12/2023.
//

import Foundation

final class NewListModalViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var showAlert: Bool = false

    var canAdd: Bool {
        return !name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func addNewList() {
        print("Add \(name)")
    }
}
