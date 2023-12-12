//
//  ShoppingListError.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 12/12/2023.
//

enum ShoppingListError: Error {
    case alreadyExist(withId: String)
    case notExist(withId: String)
}
