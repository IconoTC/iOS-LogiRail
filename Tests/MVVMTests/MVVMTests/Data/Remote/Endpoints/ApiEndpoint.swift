//
//  ApiEndpoint.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol ApiEndpoint {
    var url: URL { get }
}

extension ApiEndpoint {
    var baseURL: String {
        "https://dragonball.keepcoding.education/api"
    }
}
