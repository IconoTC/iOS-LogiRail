//
//  TestsHeroLocationToAnnnotationMapper.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

@testable import MVVMTests

final class TestsHeroLocationToAnnnotationMapper: HeroLocationToAnnotationMapper {
    var mapHeroLocationsResult: HeroAnnotations = []
    var mapHeroLocationResult: HeroAnnotation?

    func map(_ data: HeroLocations) -> HeroAnnotations {
        mapHeroLocationsResult
    }

    func map(_ data: HeroLocation) -> HeroAnnotation? {
        mapHeroLocationResult
    }
}
