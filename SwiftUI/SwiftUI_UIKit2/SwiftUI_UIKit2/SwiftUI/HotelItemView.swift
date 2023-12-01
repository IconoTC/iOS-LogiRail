//
//  HotelItemView.swift
//  SwiftUI_UIKit2
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct HotelItemView: View {
    @ObservedObject var state: HotelItemState

    var body: some View {
        GeometryReader { geometryProxy in
            VStack(spacing: 16) {
                if let hotelImages = state.hotelImages {
                    ImagesPagerView(
                        sizeHeight: geometryProxy.size.height * 0.3,
                        hotelImages: hotelImages
                    )
                } else {
                    Spacer()
                        .frame(height: geometryProxy.size.height * 0.3)
                }

                Group {
                    if let hotelDescription = state.hotelDescription {
                        HotelDescriptionView(
                            hotelDescriptionData: hotelDescription
                        )
                    }

                    if let hotelPrice = state.hotelPrice {
                        Divider()
                        HotelPriceView(
                            priceData: hotelPrice
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(alignment: .top)
        }
        .onAppear {
            state.onViewAppear()
        }
    }
}

#Preview {
    HotelItemView(state: .init())
}
