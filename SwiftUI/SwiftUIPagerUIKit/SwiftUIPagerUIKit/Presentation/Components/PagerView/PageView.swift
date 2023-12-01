//
//  PageView.swift
//  SwiftUIPagerUIKit
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct PageView: View {
    var landmark: Landmark

    var body: some View {
        landmark.featuredImage?
            .resizable()
            .aspectRatio(3/2, contentMode: .fit)
            .overlay {
                TextOverlay(
                    landmark: landmark
                )
            }
            .frame(maxWidth: .infinity)
    }
}

struct TextOverlay: View {
    var landmark: Landmark

    private var gradient: LinearGradient {
        .linearGradient(
            .init(colors: [.black.opacity(0.6),
                           .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
                    .font(.footnote)
            }
            .foregroundStyle(.white)
            .padding()
        }
    }
}

#Preview {
    PageView(
        landmark: SampleData().features[0]
    )
}
