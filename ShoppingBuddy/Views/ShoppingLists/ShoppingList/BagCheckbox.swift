//
//  BagCheckbox.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 19/12/2023.
//

import Foundation
import SwiftUI

struct BagCheckbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "bag.fill" : "bag")
                    .foregroundStyle(configuration.isOn ? Color.accentColor : .secondary)
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}
