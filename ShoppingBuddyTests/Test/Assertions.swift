//
//  Assertions.swift
//  ShoppingBuddyTests
//
//  Created by Kamil Turek on 22/02/2024.
//

import XCTest

func assertEqualInAnyOrder<T: Equatable>(_ current: Array<T>, _ other: Array<T>) {
    current.forEach { currentItem in
        XCTAssert(
            other.contains(where: { otherItem in otherItem == currentItem }),
            "\(currentItem) not found in \(other)"
        )
    }
}
