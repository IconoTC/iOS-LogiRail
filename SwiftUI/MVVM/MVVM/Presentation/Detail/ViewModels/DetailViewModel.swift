//
//  DetailViewModel.swift
//  MVVM
//
//  Created by David Jardon on 24/11/23.
//

import Foundation

class DetailViewModel: DetailViewDelegate {
    var viewState: ((DetailViewState) -> Void)?

    private var character: CharacterModel

    init(character: CharacterModel) {
        self.character = character
    }

    func onViewAppear() {
        viewState?(.updateImage(character.image))
        viewState?(.updateTitle(character.name))
        viewState?(.updateDescription(character.description))
    }
}
