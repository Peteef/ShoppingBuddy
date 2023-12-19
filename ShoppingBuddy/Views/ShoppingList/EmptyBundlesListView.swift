//
//  EmptyBundlesListView.swift
//  ShoppingBuddy
//
//  Created by Kamil Turek on 17/12/2023.
//

import SwiftUI

struct EmptyBundlesListView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("bundlesList.emptyState")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(.systemGray2))
            Spacer()
        }
    }
}

#Preview {
    EmptyBundlesListView()
}
