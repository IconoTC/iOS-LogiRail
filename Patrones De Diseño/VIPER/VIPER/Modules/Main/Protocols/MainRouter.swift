//
//  MainRouter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

protocol MainRouter: AnyObject {
    var presenter: MainPresenter? { get set }
    var viewController: UIViewController? { get set }
}

protocol MainRouterInput: AnyObject {
    func showDetail(for character: CharacterModel) 
}
