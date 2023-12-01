//
//  SplashState.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

@MainActor
final class SplashState: ObservableObject {
    @Published var showLoading: Bool = false

    private var router: NavigationRouter?

    func onViewAppear(router: NavigationRouter) {
        self.router = router
        showLoading = true
        loadData()
    }

    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.showLoading = false
            self.router?.push(to: .main)
        }
    }
}
