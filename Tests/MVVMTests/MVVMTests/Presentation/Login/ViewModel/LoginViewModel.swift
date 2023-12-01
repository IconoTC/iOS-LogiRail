//
//  LoginViewModel.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import Foundation

@MainActor
protocol LoginViewModel {
    var viewState: ((LoginViewState) -> Void)? { get set }
    func onLoginPressed(email: String?, password: String?)

}

enum LoginViewState {
    case loading(_ isLoading: Bool)
    case showErrorEmail(_ error: String?)
    case showErrorPassword(_ error: String?)
}

@MainActor
final class DefaultLoginViewModel: LoginViewModel {
    private let router: Router
    private let emailFieldValidationUseCase: FieldValidationUseCase
    private let passwordFieldValidationUseCase: FieldValidationUseCase
    private let loginUseCase: LoginUseCase

    var viewState: ((LoginViewState) -> Void)?


    init(
        router: Router,
        emailFieldValidationUseCase: FieldValidationUseCase,
        passwordFieldValidationUseCase: FieldValidationUseCase,
        loginUseCase: LoginUseCase
    ) {
        self.router = router
        self.emailFieldValidationUseCase = emailFieldValidationUseCase
        self.passwordFieldValidationUseCase = passwordFieldValidationUseCase
        self.loginUseCase = loginUseCase
    }

    func onLoginPressed(email: String?, password: String?) {
        viewState?(.loading(true))
        initLoginProcess(
            email: email,
            password: password
        )
    }

    private func initLoginProcess(email: String?, password: String?) {
        Task { [weak self] in
            if self?.validateField(email: email) == false {
                self?.sendEmailValidationError("Invalid email format")
                self?.viewState?(.loading(false))
            } else if self?.validateField(password: password) == false {
                self?.sendPasswordValidationError("Invalid password format")
                self?.viewState?(.loading(false))
            } else {
                guard let email, let password else {
                    return
                }

                let loginResult = await self?.doLoginWith(
                    email: email,
                    password: password
                ) ?? false

                self?.handleLoginResponse(loginResult)
            }
        }
    }

    private func validateField(email: String?) -> Bool {
        emailFieldValidationUseCase.isValidField(email)
    }

    private func validateField(password: String?) -> Bool {
        passwordFieldValidationUseCase.isValidField(password)
    }

    private func sendEmailValidationError(_ error: String?) {
        viewState?(.showErrorEmail(error))
    }

    private func sendPasswordValidationError(_ error: String?) {
        viewState?(.showErrorPassword(error))
    }

    private func doLoginWith(email: String, password: String) async -> Bool {
        await loginUseCase.login(
            user: email,
            password: password
        )
    }

    private func handleLoginResponse(_ isLogged: Bool) {
        if isLogged {
            router.set(
                to: HeroesNavigation(router: router)
            )
        } else {
            // TODO: Show login alert error
        }
        viewState?(.loading(false))
    }
}
