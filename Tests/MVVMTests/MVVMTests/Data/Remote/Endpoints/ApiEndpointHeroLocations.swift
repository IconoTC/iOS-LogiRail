//
//  ApiEndpointHeroLocations.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiEndpointHeroLocations: ApiEndpoint {
    private let endpoint = "/heros/locations"

    var url: URL {
        URL(string: "\(baseURL)\(endpoint)") ?? URL(filePath: "")
    }
}
