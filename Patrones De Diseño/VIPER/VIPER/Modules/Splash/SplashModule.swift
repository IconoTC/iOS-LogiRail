//
//  SplashModule.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class SplashModule {
    private enum Constants {
        static let storyboardName = "Splash"
    }

    func buildDefault() -> DefaultSplashView {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        
        let view = getDefaultController(from: storyboard)
        let interactor = DefaultSplashInteractor()
        let presenter = DefaultSplashPresenter()
        let router = DefaultSplashRouter()

        view.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view

        return view
    }

    private func getDefaultController(from storyboard: UIStoryboard) -> DefaultSplashView {
        storyboard.instantiateInitialViewController() as! DefaultSplashView
    }
}
