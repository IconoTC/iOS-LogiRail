//
//  MockGetAllCharactersUseCase.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

// MARK: - MOCK DATOS -
final class MockGetAllCharactersUseCase: GetAllCharactersUseCase {
    private let apiServices: ApiServices = MockApiServices()

    func characters() async -> CharactersModel {
        await apiServices.fetchCharacters()
    }
}
