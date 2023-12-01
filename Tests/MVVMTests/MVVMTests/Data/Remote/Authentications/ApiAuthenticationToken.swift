//
//  ApiAuthenticationToken.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiAuthenticationToken: ApiAuthentication {
    var authentication: String {
        token
    }

    var type: ApiAuthenticationType {
        ApiAuthenticationTypeBearer()
    }

    private let token: String

    init(token: String) {
        self.token = token
    }
}
