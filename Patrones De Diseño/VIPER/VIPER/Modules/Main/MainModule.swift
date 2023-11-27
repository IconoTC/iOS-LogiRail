//
//  MainModule.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import UIKit

class MainModule {
    private enum Constants {
        static let storyboardName = "Main"
    }

    func buildDefault() -> DefaultMainView {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)

        let view = getDefaultController(from: storyboard)
        let interactor = DefaultMainInteractor(getAllCharactersUseCase: DefaultGetAllCharactersUseCase())
        let presenter = DefaultMainPresenter()
        let router = DefaultMainRouter()

        view.presenterInput = presenter
        view.presenterOutput = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view

        return view
    }

    func buildMock() -> DefaultMainView {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)

        let view = getDefaultController(from: storyboard)
        let interactor = DefaultMainInteractor(getAllCharactersUseCase: MockGetAllCharactersUseCase())
        let presenter = DefaultMainPresenter()
        let router = DefaultMainRouter()

        view.presenterInput = presenter
        view.presenterOutput = presenter

        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router

        interactor.presenter = presenter

        router.presenter = presenter
        router.viewController = view

        return view
    }

    private func getDefaultController(from storyboard: UIStoryboard) -> DefaultMainView {
        storyboard.instantiateInitialViewController() as! DefaultMainView
    }
}
