//
//  GetHeroLocationsUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol GetHeroLocationsUseCase {
    func locations(by heroId: String) async -> HeroLocations
}
