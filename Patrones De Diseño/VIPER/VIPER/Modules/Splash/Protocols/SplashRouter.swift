//
//  SplashRouter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

protocol SplashRouter: AnyObject {
    var presenter: SplashPresenter? { get set }
    var viewController: UIViewController? { get set }
}

protocol SplashRouterInput: AnyObject {
    func showMain()
}
