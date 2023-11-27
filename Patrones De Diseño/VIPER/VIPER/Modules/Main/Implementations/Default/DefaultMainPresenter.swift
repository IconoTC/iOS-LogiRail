//
//  DefaultMainPresenter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

class DefaultMainPresenter: MainPresenter {
    var router: MainRouterInput?
    var interactor: MainInteractorOutput?
    weak var view: MainViewInput?

    var characters: CharactersModel = []

    private func loadData() {
        Task { [weak self] in
            self?.characters = await self?.interactor?.characters() ?? []

            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
                self?.view?.reloadData()
            }
        }
    }
}

extension DefaultMainPresenter: MainPresenterInput {
    func onViewAppear() {
        loadData()
    }
    
    func onCharacterPressed(_ index: Int) {
        if let characterPressed = character(by: index) {
            router?.showDetail(for: characterPressed)
        } else {
            // Show error
        }
    }
}

extension DefaultMainPresenter: MainPresenterOutput {
    func character(by index: Int) -> CharacterModel? {
        index < characters.count ? characters[index] : nil
    }
}
