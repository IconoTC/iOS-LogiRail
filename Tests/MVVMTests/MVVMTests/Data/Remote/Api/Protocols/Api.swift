//
//  Api.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol Api {
    func callService<T: Codable>(
        authentication: ApiAuthentication,
        contentType: ApiContentType,
        httpMethod: ApiHTTPMethod,
        parameters: ApiParameters
    ) async -> T?
}
