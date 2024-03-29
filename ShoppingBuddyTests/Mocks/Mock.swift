//
//  Mock.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 08/02/2024.
//

import Foundation

//TODO: Rewrite this using macro
class Mock {
    private var invocations: [String:Int] = [:]
    
    func wasCalled(name: String, times: Int = 1) -> Bool {
        guard invocations[name, default: 0] == times else {
            return false
        }
        
        invocations[name] = 0
        return true
    }
    
    func wasNotCalled(name: String) -> Bool {
        wasCalled(name: name, times: 0)
    }
    
    func resetInvocations() {
        invocations = [:]
    }
    
    func register(_ name: String) {
        invocations[name, default: 0] += 1
    }
}
