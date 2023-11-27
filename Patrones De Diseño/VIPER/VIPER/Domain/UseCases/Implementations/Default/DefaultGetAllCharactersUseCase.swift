//
//  DefaultGetAllCharactersUseCase.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

final class DefaultGetAllCharactersUseCase: GetAllCharactersUseCase {
    private let apiServices: ApiServices = DefaultApiServices()

    func characters() async -> CharactersModel {
        await apiServices.fetchCharacters()
    }
}
