//
//  PagerView.swift
//  SwiftUIPagerUIKit
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI


struct PagerView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(
                pages: pages,
                currentPage: $currentPage
            )

            PageControl(
                numOfPages: pages.count,
                currentPage: $currentPage
            )
            .frame(width: CGFloat(pages.count * 18))
            .padding(.trailing)
        }
    }
}

#Preview {
    PagerView(
        pages: SampleData().features.map {
            PageView(landmark: $0)
        }
    )
    .aspectRatio(3/2, contentMode: .fit)
}
