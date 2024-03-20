//
//  ElementAssertions.swift
//  ShoppingBuddyUITests
//
//  Created by Kamil Turek on 20/03/2024.
//

import XCTest

extension XCUIElement {
    func assertChecked() {
        assertThat(self.isChecked())
    }
    
    func assertUnchecked() {
        assertNot(self.isChecked())
    }
    
    private func isChecked() -> Bool {
        return self.value as? String == "1"
    }
}
