//
//  TabListView.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

typealias Items = [Item]

struct Item: Identifiable {
    var id = UUID()
    var image: String?
    var title: String
    var subtitle: String?
}

struct TabListView: View {
    let items: Items

    var body: some View {
        List(items) { item in
            ItemCellView(item: item)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    TabListView(
        items: []
    )
}
