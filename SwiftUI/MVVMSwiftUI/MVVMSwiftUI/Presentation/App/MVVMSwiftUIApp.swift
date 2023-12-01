//
//  MVVMSwiftUIApp.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI
import NavigationStack

@main
@MainActor
struct MVVMSwiftUIApp: App {
    private let navigationRouter = NavigationRouter(navStack: .init())

    var body: some Scene {
        WindowGroup {
            MVVMSwiftUIView()
                .environmentObject(navigationRouter)
        }
    }
}

@MainActor
struct MVVMSwiftUIView: View {
    @EnvironmentObject private var router: NavigationRouter
    private let splashState = SplashState()

    var body: some View {
        NavigationStackView(navigationStack: router.navStack) {
            SplashView(state: splashState)
        }
    }
}
