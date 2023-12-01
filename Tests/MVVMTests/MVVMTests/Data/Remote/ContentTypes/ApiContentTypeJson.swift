//
//  ApiContentTypeJson.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiContentTypeJson: ApiContentType {
    var contentType: String {
        "application/json; charset=utf-8"
    }
}
