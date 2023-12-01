//
//  SplashViewModel.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

@MainActor
protocol SplashViewModel: AnyObject {
    var viewState: ((SplasViewState) -> Void)? { get set }
    func onViewAppear()
}

enum SplasViewState {
    case loading(_ isLoading: Bool)
}

@MainActor
class DefaultSplashViewModel: SplashViewModel {
    private var userLoggedUseCase: UserLoggedUseCase
    private var router: Router

    var viewState: ((SplasViewState) -> Void)?

    private var isUserLogged: Bool {
        userLoggedUseCase.isUserLogged
    }


    init(
        router: Router,
        userLoggedUseCase: UserLoggedUseCase
    ) {
        self.router = router
        self.userLoggedUseCase = userLoggedUseCase
    }

    func onViewAppear() {
        viewState?(.loading(true))
        checkUserSession()
    }

    private func checkUserSession() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.isUserLogged ? self.navigateToHeroes() : self.navigateToLogin()
            self.viewState?(.loading(false))
        }
    }

    private func navigateToHeroes() {
        router.set(
            to: HeroesNavigation(router: router)
        )
    }

    private func navigateToLogin() {
        router.set(
            to: LoginNavigation(router: router)
        )
    }
}
