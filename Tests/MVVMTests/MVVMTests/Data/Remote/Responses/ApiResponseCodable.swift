//
//  ApiResponseCodable.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiResponseCodable: ApiResponse {
    func parseResponse<T>(data: Data?) -> T? where T: Decodable, T: Encodable {
        if let data {
            try? JSONDecoder().decode(T.self, from: data)
        } else {
            nil
        }
    }
}
