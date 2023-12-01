//
//  DefaultApi.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class DefaultApi: Api {
    private let apiRequest: ApiRequest
    private let apiResponse: ApiResponse

    init(
        apiRequest: ApiRequest,
        apiResponse: ApiResponse
    ) {
        self.apiRequest = apiRequest
        self.apiResponse = apiResponse
    }

    func callService<T>(
        authentication: ApiAuthentication,
        contentType: ApiContentType,
        httpMethod: ApiHTTPMethod,
        parameters: ApiParameters
    ) async -> T? where T : Decodable, T : Encodable {
        let request = apiRequest.httpMethod(httpMethod.method)
            .contentType(contentType.contentType)
            .authorization(authentication.authentication, type: authentication.type.type)
            .body(parameters.parameters)
            .build()

        do {
            let responseData = try await URLSession.shared.data(for: request)
            
            guard (responseData.1 as? HTTPURLResponse)?.statusCode == 200 else {
                return nil
            }

            return apiResponse.parseResponse(data: responseData.0)
        } catch {
            print(error)
            return nil
        }
    }
}
