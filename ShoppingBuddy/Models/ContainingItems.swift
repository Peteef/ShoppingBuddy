//
//  ContainingItems.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 28/12/2023.
//

import Foundation

protocol ContainingItems {
    associatedtype I
    
    var items: [I] { get set }
}
