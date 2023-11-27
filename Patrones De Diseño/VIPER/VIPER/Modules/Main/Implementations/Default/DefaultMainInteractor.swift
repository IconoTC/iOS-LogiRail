//
//  DefaultMainInteractor.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

class DefaultMainInteractor: MainInteractor {
    private let getAllCharactersUseCase: GetAllCharactersUseCase
    weak var presenter: MainPresenter?

    init(getAllCharactersUseCase: GetAllCharactersUseCase) {
        self.getAllCharactersUseCase = getAllCharactersUseCase
    }
}

extension DefaultMainInteractor: MainInteractorOutput {
    func characters() async -> CharactersModel {
        await getAllCharactersUseCase.characters()
    }
}
