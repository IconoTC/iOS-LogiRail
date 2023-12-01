//
//  ApiResponseString.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiResponseString: ApiResponse {
    func parseResponse<T>(data: Data?) -> T? where T: Decodable, T: Encodable {
        if let data {
            return String(data: data, encoding: .utf8) as? T
        } else {
            return nil
        }
    }
}
