//
//  SplashView.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var router: NavigationRouter
    @ObservedObject var state: SplashState

    private let backgroundImage = "fondo_simpsons"

    var body: some View {
        ZStack {
            Image(backgroundImage)
                .resizable()
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .ignoresSafeArea()

            if state.showLoading {
                ProgressView()
            }
        }
        .onAppear {
            state.onViewAppear(router: router)
        }
    }
}

#Preview {
    SplashView(state: .init())
        .environmentObject(NavigationRouter(navStack: .init()))
}
