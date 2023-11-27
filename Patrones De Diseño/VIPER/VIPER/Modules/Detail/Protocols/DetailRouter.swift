//
//  DetailRouter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

protocol DetailRouter: AnyObject {
    var presenter: DetailPresenter? { get set }
    var viewController: UIViewController? { get set }
}
