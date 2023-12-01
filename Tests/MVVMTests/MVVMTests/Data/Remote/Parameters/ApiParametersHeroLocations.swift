//
//  ApiParametersHeroLocations.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

struct ApiParametersHeroLocationsData {
    var heroId: String
}

final class ApiParametersHeroLocations: ApiParameters {
    private(set) var parameters: Data

    private enum Key {
        static let id = "id"
    }

    init(data: ApiParametersHeroLocationsData) {
        let jsonData: [String: Any] = [Key.id: data.heroId]
        self.parameters = (try? JSONSerialization.data(withJSONObject: jsonData)) ?? .init()
    }
}
