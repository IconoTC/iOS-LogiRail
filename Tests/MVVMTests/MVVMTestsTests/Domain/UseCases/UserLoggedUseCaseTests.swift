//
//  UserLoggedUseCaseTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
@testable import MVVMTests

final class UserLoggedUseCaseTests: XCTestCase {
    private var sut: UserLoggedUseCase!
    private var secureDataProvider: SecureDataProvider!

    override func setUp() {
        super.setUp()
        secureDataProvider = TestsSecureDataProvider()
        sut = DefaultUserLoggedUseCase(
            secureDataProvider: secureDataProvider
        )
    }

    override func tearDown() {
        secureDataProvider = nil
        sut = nil
        super.tearDown()
    }

    func testIsUserLogged_WhenUserHasToken_ShouldReturnTrue() {
        // Arrange
        let token = "123456789"

        // Act
        secureDataProvider.save(token: token)
        let isUserLogged = sut.isUserLogged

        // Assert
        XCTAssertTrue(isUserLogged)
    }

    func testIsUserLogged_WhenUserHasNotToken_ShouldReturnFalse() {
        // Arrange
        let token = ""

        // Act
        secureDataProvider.save(token: token)
        let isUserLogged = sut.isUserLogged

        // Assert
        XCTAssertFalse(isUserLogged)
    }
}
