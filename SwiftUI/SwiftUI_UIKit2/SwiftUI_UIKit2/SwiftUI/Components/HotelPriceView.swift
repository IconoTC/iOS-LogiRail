//
//  HotelPriceView.swift
//  SwiftUI_UIKit2
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

// MARK: - View Data
struct PriceData {
    let isOnlyRate: Bool
    let priceDiscount: PriceDiscount?
    let finalPrice: Float
    let finalPriceType: String?
    let priceDisclaimer: String?
}

struct PriceDiscount {
    let discount: Float
    let discountPercentaje: Float
}


struct HotelPriceView: View {
    var priceData: PriceData

    var body: some View {
        VStack(spacing: 12) {
            if priceData.isOnlyRate {
                priceTitleView
            }

            if let priceDiscount = priceData.priceDiscount {
                priceDiscountView(priceDiscount)
            }

            priceTotalView

            if let priceDisclaimer = priceData.priceDisclaimer {
                priceDisclaimerView(priceDisclaimer)
            }
        }
    }

    private var priceTitleView: some View {
        HStack {
            Spacer()
            Image(systemName: "lanyardcard")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(height: 20)
            Text("App Only Rate")
                .font(.headline)
                .bold()
        }
        .foregroundColor(.green)
    }

    private func priceDiscountView(_ priceDiscount: PriceDiscount) -> some View {
        HStack {
            Spacer()
            Text(String(format: "%.2f€", priceDiscount.discount))
                .font(.headline)
                .bold()
                .strikethrough()
            Text(String(format: "-%.0f%%", priceDiscount.discountPercentaje))
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.green)
                )
        }
    }

    private var priceTotalView: some View {
        HStack {
            Spacer()
            VStack {
                Button {

                } label: {
                    HStack {
                        Text(String(format: "%.2f€", priceData.finalPrice))
                            .font(.title)
                            .bold()
                            .foregroundStyle(.green)
                        Image(systemName: "arrowshape.turn.up.forward")
                            .renderingMode(.template)
                            .foregroundStyle(.red)
                    }
                }
            }

            if let finalPriceType = priceData.finalPriceType {
                Text(finalPriceType)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .bold()
            }
        }
    }

    private func priceDisclaimerView(_ priceDisclaimer: String) -> some View {
        HStack {
            Spacer()
            Text(priceDisclaimer)
                .font(.footnote)
                .foregroundStyle(.gray)
                .bold()
        }
    }
}

#Preview {
    HotelPriceView(
        priceData: .init(
            isOnlyRate: true,
            priceDiscount: PriceDiscount(discount: 93.65,
                                         discountPercentaje: 88),
            finalPrice: 10.90,
            finalPriceType: "per night",
            priceDisclaimer: "Excluded: [total] taxes & fees"
        )
    )
}
