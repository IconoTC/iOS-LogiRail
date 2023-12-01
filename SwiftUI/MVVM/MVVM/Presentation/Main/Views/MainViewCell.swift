//
//  MainViewCell.swift
//  MVVM
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct MainViewCell: View {
    var image: String

    var body: some View {
        VStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(4.0)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(
            Color.white.cornerRadius(4.0).shadow(radius: 4.0)
        )
        .padding(8)
    }
}

#Preview {
    MainViewCell(image: "bart_simpson")
}
