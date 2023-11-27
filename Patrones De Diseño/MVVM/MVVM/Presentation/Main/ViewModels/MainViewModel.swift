//
//  MainViewModel.swift
//  MVVM
//
//  Created by David Jardon on 24/11/23.
//

import Foundation

class MainViewModel: MainViewDelegate {
    private let getAllCharactersUseCase: GetAllCharactersUseCase = DefaultGetAllCharactersUseCase()

    var viewState: ((MainViewState) -> Void)?
    var dataCount: Int {
        characters.count
    }

    private var characters: CharactersModel = []

    func onViewAppear() {
        loadData()
        viewState?(.updateViews)
    }

    func character(by index: Int) -> CharacterModel? {
        index < dataCount ? characters[index] : nil
    }

    func onCharacterPressed(_ index: Int) {
        guard let characterPressed = character(by: index) else {
            return
        }

        viewState?(.navigateToDetail(characterPressed))
    }

    private func loadData() {
        characters = getAllCharactersUseCase.characters
    }
}
