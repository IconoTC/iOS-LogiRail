//
//  DefaultSplashRouter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class DefaultSplashRouter: SplashRouter {
    weak var presenter: SplashPresenter?
    weak var viewController: UIViewController?
}

extension DefaultSplashRouter: SplashRouterInput {
    func showMain() {
        let nextViewController = MainModule().buildDefault()
        viewController?.navigationController?.setViewControllers(
            [nextViewController],
            animated: true
        )
    }
}
