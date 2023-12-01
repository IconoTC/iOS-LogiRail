//
//  TestsGetHeroesUseCase.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

@testable import MVVMTests

final class TestsGetHeroesUseCase: GetHeroesUseCase {
    var heroesResult: Heroes = []

    func heroes() async -> Heroes {
        heroesResult
    }

    func heroesFiltered(by name: String) async -> Heroes {
        heroesResult
    }
}
