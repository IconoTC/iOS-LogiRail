//
//  SplashViewModelTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
@testable import MVVMTests

@MainActor
final class SplashViewModelTests: XCTestCase {
    private var sut: SplashViewModel!
    private var testRouter: TestRouter!
    private var testUserLoggedUseCase: TestUserLoggedUseCase!

    override func setUp() {
        super.setUp()
        testRouter = TestRouter()
        testUserLoggedUseCase = TestUserLoggedUseCase()

        sut = DefaultSplashViewModel(router: testRouter,
                                     userLoggedUseCase: testUserLoggedUseCase)
    }

    override func tearDown() {
        testRouter = nil
        testUserLoggedUseCase = nil
        sut = nil
        super.tearDown()
    }

    func testOnViewAppear_ShouldChangeStateToLoading() {
        // Arrange
        let expectation = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .loading(true) = state {
                expectation.fulfill()
            }
        }

        // Act
        sut.onViewAppear()

        // Assert
        wait(for: [expectation], timeout: 5.0)
    }

    func testOnViewAppear_WhenUserLogged_ShouldNavigateToHeroes() {
        // Arrange
        testUserLoggedUseCase.isUserLogged = true
        let expectation = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .loading(false) = state {
                expectation.fulfill()
            }
        }

        // Act
        sut.onViewAppear()

        // Assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(testRouter.lastNavigatedViewController is HeroesViewController)
    }

    func testOnViewAppear_WhenUserNotLogged_ShouldNavigateToLogin() {
        // Arrange
        testUserLoggedUseCase.isUserLogged = false
        let expectation = XCTestExpectation(description: "")

        sut.viewState = { state in
            if case .loading(false) = state {
                expectation.fulfill()
            }
        }

        // Act
        sut.onViewAppear()

        // Assert
        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(testRouter.lastNavigatedViewController is LoginViewController)
    }
}
