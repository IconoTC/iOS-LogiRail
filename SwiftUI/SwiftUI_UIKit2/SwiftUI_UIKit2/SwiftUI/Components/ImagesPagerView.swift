//
//  ImagesPagerView.swift
//  SwiftUI_UIKit2
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct HotelImagesData {
    let images: [String]
}

struct ImagesPagerView: View {
    var sizeHeight: CGFloat
    var hotelImages: HotelImagesData

    var body: some View {
        VStack {
            TabView {
                ForEach(hotelImages.images, id: \.self) {
                    Image($0)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height: sizeHeight)
        }
    }
}

#Preview {
    ImagesPagerView(
        sizeHeight: 200,
        hotelImages: .init(
            images: ["img_hotel_1",
                     "img_hotel_2",
                     "img_hotel_3",
                     "img_hotel_4"]
        )
    )
}
