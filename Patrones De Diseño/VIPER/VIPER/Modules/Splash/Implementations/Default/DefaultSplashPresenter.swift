//
//  DefaultSplashPresenter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

class DefaultSplashPresenter: SplashPresenter {
    var router: SplashRouterInput?
    var interactor: SplashInteractorInput?
    weak var view: SplashViewInput?

    private func checkUserSession() {
        view?.showLoading(true)
        interactor?.checkUserSession { [weak self] result in
            self?.view?.showLoading(false)
            self?.router?.showMain()
        }
    }
}

extension DefaultSplashPresenter: SplashPresenterInput {
    func onViewAppear() {
        checkUserSession()
    }
}
