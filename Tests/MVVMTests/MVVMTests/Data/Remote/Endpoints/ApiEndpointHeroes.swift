//
//  ApiEndpointHeroes.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiEndpointHeroes: ApiEndpoint {
    private let endpoint = "/heros/all"

    var url: URL {
        URL(string: "\(baseURL)\(endpoint)") ?? URL(filePath: "")
    }
}
