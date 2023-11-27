//
//  SplashView.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol SplashView: AnyObject {
    var presenter: SplashPresenterInput? { get set }
}

protocol SplashViewInput: AnyObject {
    func showLoading(_ show: Bool)
}
