//
//  ApiParametersEmpty.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiParametersEmpty: ApiParameters {
    var parameters: Data {
        .init()
    }
}
