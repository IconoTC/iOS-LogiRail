//
//  LoginNavigation.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit
import KeychainSwift

@MainActor
final class LoginNavigation: RouterNavigation {
    var storyboardName: String {
        "Login"
    }

    var viewController: LoginViewController? {
        let controller = storyboard.instantiateInitialViewController() as? LoginViewController
        controller?.viewModel = viewModel
        return controller
    }

    private var viewModel: LoginViewModel

    init(router: Router) {
        viewModel = DefaultLoginViewModel(
            router: router,
            emailFieldValidationUseCase: EmailValidationUseCase(),
            passwordFieldValidationUseCase: PasswordValidationUseCase(),
            loginUseCase: DefaultLoginUseCase(
                loginService: DefaultApi(
                    apiRequest: ApiRequestURLSession(endpoint: ApiEndpointLogin()),
                    apiResponse: ApiResponseString()
                ),
                secureDataProvider: DefaultSecureDataProvider(
                    secureStoreProvider: KeychainSwift()
                )
            )
        )
    }
}
