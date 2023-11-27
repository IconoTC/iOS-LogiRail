//
//  DefaultDetailPresenter.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

class DefaultDetailPresenter: DetailPresenter {
    var router: DetailRouter?
    var interactor: DetailInteractor?
    weak var view: DetailViewInput?

    private var character: CharacterModel

    init(character: CharacterModel) {
        self.character = character
    }

    private func handleData() {
        view?.showData(character: character)
    }
}

extension DefaultDetailPresenter: DetailPresenterInput {
    func onViewAppear() {
        handleData()
    }
}
