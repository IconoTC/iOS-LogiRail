//
//  GetHeroesUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol GetHeroesUseCase {
    func heroes() async -> Heroes
    func heroesFiltered(by name: String) async -> Heroes
}
