//
//  ApiRequest.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol ApiRequest {
    func httpMethod(_ httpMethod: String) -> ApiRequest
    func contentType(_ contentType: String) -> ApiRequest
    func authorization(_ authorization: String, type: String) -> ApiRequest
    func body(_ body: Data) -> ApiRequest
    func build() -> URLRequest
}
