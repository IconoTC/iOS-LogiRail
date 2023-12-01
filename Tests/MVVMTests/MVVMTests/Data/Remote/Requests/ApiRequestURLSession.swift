//
//  ApiRequestURLSession.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiRequestURLSession: ApiRequest {
    private var urlRequest: URLRequest

    private enum HTTPHeaderField {
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
    }

    init(endpoint: ApiEndpoint) {
        self.urlRequest = URLRequest(url: endpoint.url)
    }

    func httpMethod(_ httpMethod: String) -> ApiRequest {
        urlRequest.httpMethod = httpMethod
        return self
    }
    
    func contentType(_ contentType: String) -> ApiRequest {
        urlRequest.setValue(
            contentType,
            forHTTPHeaderField: HTTPHeaderField.contentType
        )
        return self
    }
    
    func authorization(_ authorization: String, type: String) -> ApiRequest {
        urlRequest.setValue(
            "\(type) \(authorization)",
            forHTTPHeaderField: HTTPHeaderField.authorization
        )
        return self
    }
    
    func body(_ body: Data) -> ApiRequest {
        urlRequest.httpBody = body
        return self
    }
    
    func build() -> URLRequest {
        urlRequest
    }
}
