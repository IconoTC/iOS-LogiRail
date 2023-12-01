//
//  SwiftUIPagerUIKitApp.swift
//  SwiftUIPagerUIKit
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

@main
struct SwiftUIPagerUIKitApp: App {
    @State private var sampleData = SampleData()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(sampleData)
        }
    }
}
