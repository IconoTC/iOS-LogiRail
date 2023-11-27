//
//  DefaultMainRouter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class DefaultMainRouter: MainRouter {
    weak var presenter: MainPresenter?
    weak var viewController: UIViewController?
}

extension DefaultMainRouter: MainRouterInput {
    func showDetail(for character: CharacterModel) {
        let nextViewController = DetailModule().buildDefault(character: character)
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
