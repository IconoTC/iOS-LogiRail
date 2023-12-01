//
//  MainCellView.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct MainCellView: View {
    var image: String
    var onPressed: (() -> Void)? = nil

    var body: some View {
        Button {
            onPressed?()
        } label: {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(4.0)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(Color.white.cornerRadius(4.0).shadow(radius: 4.0))
        .padding(16)
    }
}

#Preview {
    VStack {
        MainCellView(
            image: "abraham_simpson"
        )
        MainCellView(
            image: "bart_simpson"
        )
        MainCellView(
            image: "homer_simpson"
        )
    }
}

