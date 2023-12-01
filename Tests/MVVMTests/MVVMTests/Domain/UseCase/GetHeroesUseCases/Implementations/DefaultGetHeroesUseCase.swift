//
//  DefaultGetHeroesUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class DefaultGetHeroesUseCase: GetHeroesUseCase {
    private let heroesService: Api
    private let secureDataProvider: SecureDataProvider

    init(
        heroesService: Api,
        secureDataProvider: SecureDataProvider
    ) {
        self.heroesService = heroesService
        self.secureDataProvider = secureDataProvider
    }

    func heroes() async -> Heroes {
        await fetchHeroes()
    }

    func heroesFiltered(by name: String) async -> Heroes {
        await fetchHeroes(by: name)
    }

    // MARK: - Private methods -
    private func fetchHeroes(by name: String? = nil) async -> Heroes {
        guard let token = secureDataProvider.token else { return [] }

        let result: Heroes? = await heroesService.callService(
            authentication: ApiAuthenticationToken(token: token),
            contentType: ApiContentTypeJson(),
            httpMethod: ApiHTTPMethodPost(),
            parameters: ApiParametersHeroes(data: .init(heroName: name))
        )

        return result ?? []
    }
}
