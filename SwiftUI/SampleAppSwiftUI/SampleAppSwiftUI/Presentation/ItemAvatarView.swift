//
//  ItemAvatarView.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct ItemAvatarView: View {
    var image: String
    let size: CGSize

    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: size.width,
                   height: size.height)
            .clipShape(Circle())
            .background(Color.clear)
            .shadow(radius: 4)
    }
}

#Preview {
    ItemAvatarView(
        image: "img_student_1",
        size: .init(width: 40, height: 40)
    )
}
