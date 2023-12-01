//
//  TestsGetHeroLocationsUseCase.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

@testable import MVVMTests

final class TestsGetHeroLocationsUseCase: GetHeroLocationsUseCase {
    var locationsResult: HeroLocations = []

    func locations(by heroId: String) async -> HeroLocations {
        locationsResult
    }
}
