//
//  ApiParametersHeroes.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

struct ApiParametersHeroesRequestData {
    var heroName: String?
}

final class ApiParametersHeroes: ApiParameters {
    private(set) var parameters: Data

    private enum Key {
        static let name = "name"
    }

    init(data: ApiParametersHeroesRequestData) {
        let jsonData: [String: Any] = [Key.name : data.heroName ?? ""]
        self.parameters = (try? JSONSerialization.data(withJSONObject: jsonData)) ?? .init()
    }
}
