//
//  DefaultGetHeroLocationsUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class DefaultGetHeroLocationsUseCase: GetHeroLocationsUseCase {
    private let heroLocationsService: Api
    private let secureDataProvider: SecureDataProvider

    init(
        heroLocationsService: Api,
        secureDataProvider: SecureDataProvider
    ) {
        self.heroLocationsService = heroLocationsService
        self.secureDataProvider = secureDataProvider
    }

    func locations(by heroId: String) async -> HeroLocations {
        guard let token = secureDataProvider.token else { return [] }

        let heroLocations: HeroLocations? = await heroLocationsService.callService(
            authentication: ApiAuthenticationToken(token: token),
            contentType: ApiContentTypeJson(),
            httpMethod: ApiHTTPMethodPost(),
            parameters: ApiParametersHeroLocations(data: .init(heroId: heroId))
        )

        return heroLocations ?? []
    }
}
