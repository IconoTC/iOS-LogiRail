//
//  SplashInteractor.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol SplashInteractor: AnyObject {
    var presenter: SplashPresenter? { get set }
}

protocol SplashInteractorInput: AnyObject {
    func checkUserSession(_ completion: @escaping (Bool) -> Void)
}
