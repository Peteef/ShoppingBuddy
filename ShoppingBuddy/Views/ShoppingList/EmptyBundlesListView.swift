//
//  EmptyBundlesListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 17/12/2023.
//

import SwiftUI

struct EmptyBundlesListView: View {
    let onCreate: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Text("bundlesList.emptyState")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(.systemGray2))
            Button(action: onCreate, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .padding(.vertical, 8)
            })
            Spacer()
        }
    }
}

#Preview {
    EmptyBundlesListView(onCreate: { print("Create tapped") })
}
