//
//  SplashPresenter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol SplashPresenter: AnyObject {
    var router: SplashRouterInput? { get set }
    var interactor: SplashInteractorInput? { get set }
    var view: SplashViewInput? { get set }
}

protocol SplashPresenterInput: AnyObject {
    func onViewAppear()
}
