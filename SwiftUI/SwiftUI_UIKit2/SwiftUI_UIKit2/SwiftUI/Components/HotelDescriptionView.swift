//
//  HotelDescriptionView.swift
//  SwiftUI_UIKit2
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct HotelDescriptionData {
    let title: String
    let distance: String?
    let rating: HotelRatingData?
}

struct HotelRatingData {
    let currentRating: UInt
    let maxRating: UInt
}

struct HotelDescriptionView: View {
    var hotelDescriptionData: HotelDescriptionData

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            contentTitleView

            HStack {
                if let hotelDistance = hotelDescriptionData.distance {
                    contentAddressView(hotelDistance)
                }

                if let rating = hotelDescriptionData.rating {
                    Spacer()
                    ratingTripAdvisorView(rating)
                }
            }
            .frame(maxWidth: .infinity,
                   maxHeight: 16,
                   alignment: .leading)
        }
        .frame(maxWidth: .infinity)
    }

    private var contentTitleView: some View {
        Text(hotelDescriptionData.title)
            .font(.title2)
            .bold()
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }

    private func contentAddressView(_ distance: String) -> some View {
        HStack {
            Image(systemName: "location")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundStyle(.gray)
            Text(distance)
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
        }
    }

    private func ratingTripAdvisorView(_ rating: HotelRatingData) -> some View {
        HStack(alignment: .center) {
            Image("ic_trip_advisor")
                .resizable()
                .scaledToFit()
                .frame(height: 36)

            HStack(alignment: .center, spacing: 2) {
                ForEach(1...rating.maxRating, id: \.self) { number in
                    Button {

                    } label: {
                        Circle()
                            .strokeBorder(.green, lineWidth: 1)
                            .background(
                                Circle()
                                    .fill(
                                        rating.currentRating >= number ? Color.green : Color.white
                                    )
                            )
                    }
                }
                .frame(width: 16,
                       height: 16)
            }
        }
        .frame(alignment: .trailing)
    }
}


#Preview {
    HotelDescriptionView(
        hotelDescriptionData: .init(
            title: "Radisson Blu Hotel, Amsterdam City Center",
            distance: "0.25 miles from Amsterdam",
            rating: HotelRatingData(
                currentRating: 4,
                maxRating: 5
            )
        )
    )
}
