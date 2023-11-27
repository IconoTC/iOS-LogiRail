//
//  GetCharactersUseCase.swift
//  VIPER
//
//  Created by David Jardon on 27/11/23.
//

import Foundation

protocol GetAllCharactersUseCase {
    func characters() async -> CharactersModel
}
