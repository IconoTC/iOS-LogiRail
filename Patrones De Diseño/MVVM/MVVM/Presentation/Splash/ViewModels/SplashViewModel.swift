//
//  SplashViewModel.swift
//  MVVM
//
//  Created by David Jardon on 24/11/23.
//

import Foundation

class SplashViewModel: SplashViewDelegate {
    var viewState: ((SplashViewState) -> Void)?

    func onViewAppear() {
        viewState?(.loading(true))
        loadData()
    }

    func onViewDisappear() {
        viewState?(.loading(false))
    }

    private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.viewState?(.navigateToMain)
        }
    }
}
