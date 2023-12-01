//
//  ItemDetailView.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct ItemDetailView: View {
    let title: String
    let subtitle: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)

            if let subtitle {
                Text(subtitle)
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    ItemDetailView(
        title: "Title",
        subtitle: "Subtitle"
    )
}
