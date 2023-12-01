//
//  LoginViewModelTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

import XCTest
@testable import MVVMTests

@MainActor
final class LoginViewModelTests: XCTestCase {
    private var sut: LoginViewModel!
    private var testRouter: TestRouter!
    private var testEmailValidationUseCase: TestsEmailValidationUseCase!
    private var testPasswordValidationUseCase: TestsPasswordValidationUseCase!
    private var testLoginUseCase: TestsLoginUseCase!

    override func setUp() {
        super.setUp()
        testRouter = TestRouter()
        testEmailValidationUseCase = TestsEmailValidationUseCase()
        testPasswordValidationUseCase = TestsPasswordValidationUseCase()
        testLoginUseCase = TestsLoginUseCase()

        sut = DefaultLoginViewModel(
            router: testRouter,
            emailFieldValidationUseCase: testEmailValidationUseCase,
            passwordFieldValidationUseCase: testPasswordValidationUseCase,
            loginUseCase: testLoginUseCase
        )
    }

    override func tearDown() {
        testRouter = nil
        testEmailValidationUseCase = nil
        testPasswordValidationUseCase = nil
        testLoginUseCase = nil
        sut = nil
        super.tearDown()
    }

    func testOnLoginPressed_WhenInvalidEmail_ShouldShowErrorEmail() {
        // Arrange
        testEmailValidationUseCase.isValidEmailResult = false
        let expectation = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .showErrorEmail(let error) = state, error == "Invalid email format" {
                expectation.fulfill()
            }
        }

        // Act
        sut.onLoginPressed(
            email: "",
            password: "12345678"
        )

        // Assert
        wait(for: [expectation], timeout: 5.0)
    }

    func testOnLoginPressed_WhenInvalidPassword_ShouldShowErrorPassword() {
        // Arrange
        testEmailValidationUseCase.isValidEmailResult = true
        testPasswordValidationUseCase.isValidPasswordResult = false
        let expectation = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .showErrorPassword(let error) = state, error == "Invalid password format" {
                expectation.fulfill()
            }
        }

        // Act
        sut.onLoginPressed(
            email: "email@email.com",
            password: ""
        )

        // Assert
        wait(for: [expectation], timeout: 5.0)
    }

    func testOnLoginPressed_WhenValidCredentials_ShouldNavigateToHeroes() {
        // Arrange
        testEmailValidationUseCase.isValidEmailResult = true
        testPasswordValidationUseCase.isValidPasswordResult = true
        testLoginUseCase.loginResult = true

        let expectation = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .loading(false) = state {
                expectation.fulfill()
            }
        }

        // Act
        sut.onLoginPressed(
            email: "test@email.com",
            password: "12345678"
        )

        // Assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(testRouter.lastNavigatedViewController is HeroesViewController)
    }

    func testOnLoginPressed_WhenLoginFails_ShouldNotNavigateToHeroes() {
        // Arrange
        testEmailValidationUseCase.isValidEmailResult = true
        testPasswordValidationUseCase.isValidPasswordResult = true
        testLoginUseCase.loginResult = false
        let expectation = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .loading(false) = state {
                expectation.fulfill()
            }
        }

        // Act
        sut.onLoginPressed(
            email: "email@email.com",
            password: "123456"
        )

        // Assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertFalse(testRouter.lastNavigatedViewController is HeroesViewController)
    }
}
