//
//  ItemCellView.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI


struct ItemCellView: View {
    var item: Item

    var body: some View {
        HStack(alignment: .center) {
            ItemAvatarView(
                image: item.image ?? "",
                size: .init(width: 60, height: 60)
            )

            ItemDetailView(
                title: item.title,
                subtitle: item.subtitle
            )
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    ItemCellView(
        item: .init(
            image: "img_student_1",
            title: "Title",
            subtitle: "Subtitle"
        )
    )
}
