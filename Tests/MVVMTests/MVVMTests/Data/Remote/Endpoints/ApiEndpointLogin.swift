//
//  ApiEndpointLogin.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiEndpointLogin: ApiEndpoint {
    private let endpoint = "/auth/login"

    var url: URL {
        URL(string: "\(baseURL)\(endpoint)") ?? URL(filePath: "")
    }
}
