//
//  HotelItemState.swift
//  SwiftUI_UIKit2
//
//  Created by David Jardon on 1/12/23.
//

import Foundation


final class HotelItemState: ObservableObject {
    @Published var hotelImages: HotelImagesData?
    @Published var hotelPrice: PriceData?
    @Published var hotelDescription: HotelDescriptionData?


    func onViewAppear() {
        updateHotelImages()
        updateHotelDescription()
        updateHotelPriceData()
    }

    private func updateHotelImages() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.hotelImages = HotelImagesData(images: ["img_hotel_1",
                                                         "img_hotel_2",
                                                         "img_hotel_3",
                                                         "img_hotel_4"])
        }
    }

    private func updateHotelDescription() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.hotelDescription =
            HotelDescriptionData(title: "Radisson Blu Hotel, Amsterdam City Center",
                                 distance: "0.25 miles from Amsterdam",
                                 rating: HotelRatingData(currentRating: 4,
                                                         maxRating: 5))
        }
    }

    private func updateHotelPriceData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.hotelPrice = PriceData(isOnlyRate: true,
                                         priceDiscount: PriceDiscount(discount: 93.65,
                                                                      discountPercentaje: 88),
                                         finalPrice: 10.90,
                                         finalPriceType: "per night",
                                         priceDisclaimer: "Excluded: [total] taxes & fees")
        }
    }
}
