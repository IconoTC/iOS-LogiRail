//
//  ApiAuthenticationUserPassword.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class ApiAuthenticationUserPassword: ApiAuthentication {
    var authentication: String {
        String(
            format: "%@:%@",
            user,
            password
        ).data(using: .utf8)?.base64EncodedString() ?? ""
    }

    var type: ApiAuthenticationType {
        ApiAuthenticationTypeBasic()
    }

    private let user: String
    private let password: String

    init(user: String, password: String) {
        self.user = user
        self.password = password
    }
}
