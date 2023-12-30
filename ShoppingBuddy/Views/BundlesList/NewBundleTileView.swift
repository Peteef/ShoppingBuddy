//
//  NewBundleTileView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 30/12/2023.
//

import SwiftUI

struct NewBundleTileView: View {
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap, label: {
            Image(systemName: "plus")
                .frame(width: 120, height: 120)
                .background(Color.accentColor.secondary)
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 4)
                .foregroundStyle(.white) // TODO: Make color dependent on scheme
                .font(.system(size: 16, weight: .heavy))
        })
    }
}

#Preview {
    NewBundleTileView(onTap: { print("New bundle tapped") })
}
