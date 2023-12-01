//
//  ApiResponse.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol ApiResponse {
    func parseResponse<T: Codable>(data: Data?) -> T?
}
