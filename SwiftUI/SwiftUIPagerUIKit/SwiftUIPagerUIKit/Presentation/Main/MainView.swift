//
//  MainView.swift
//  SwiftUIPagerUIKit
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct MainView: View {
    @Environment(SampleData.self) var sampleData

    var body: some View {
        NavigationSplitView {
            List {
                PagerView(
                    pages: sampleData.features.map {
                        PageView(landmark: $0)
                    }
                )
                .frame(maxWidth: .infinity)
                .aspectRatio(3/2, contentMode: .fit)
            }
            .listStyle(.inset)
            .listRowInsets(EdgeInsets())
        } detail: {
            Text("Selected data")
        }
    }
}

#Preview {
    MainView()
        .environment(SampleData())
}
