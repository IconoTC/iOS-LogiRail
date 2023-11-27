//
//  DetailModule.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class DetailModule {
    private enum Constants {
        static let storyboardName = "Detail"
    }

    func buildDefault(character: CharacterModel) -> DefaultDetailView {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)

        let view = getController(from: storyboard)
        let presenter = DefaultDetailPresenter(character: character)
        let router = DefaultDetailRouter()
        let interactor = DefaultDetailInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view

        return view
    }

    private func getController(from storyboard: UIStoryboard) -> DefaultDetailView {
        storyboard.instantiateInitialViewController() as! DefaultDetailView
    }
}
