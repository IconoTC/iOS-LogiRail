//
//  DefaultLoginUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class DefaultLoginUseCase: LoginUseCase {
    private let loginService: Api
    private let secureDataProvider: SecureDataProvider

    init(
        loginService: Api,
        secureDataProvider: SecureDataProvider
    ) {
        self.loginService = loginService
        self.secureDataProvider = secureDataProvider
    }

    func login(user: String, password: String) async -> Bool {
        let result: String? = await loginService.callService(
            authentication: ApiAuthenticationUserPassword(
                user: user,
                password: password
            ),
            contentType: ApiContentTypeEmpty(),
            httpMethod: ApiHTTPMethodPost(),
            parameters: ApiParametersEmpty()
        )

        guard let result, !result.isEmpty else { return false }

        secureDataProvider.save(token: result)

        return true
    }
}
