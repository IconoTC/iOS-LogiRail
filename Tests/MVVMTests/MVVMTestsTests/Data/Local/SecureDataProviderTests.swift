//
//  SecureDataProviderTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
@testable import MVVMTests

final class SecureDataProviderTests: XCTestCase {
    private var sut: SecureDataProvider!

    override func setUp() {
        super.setUp()
        sut = DefaultSecureDataProvider(
            secureStoreProvider: TestSecureStoreProvider()
        )
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testGetToken_WhenTokenIsNil_ShouldReturnTokenIsNil() {
        // Arrange
        let expectedToken: String? = nil

        // Act
        let token = sut.token

        // Assert
        XCTAssertEqual(expectedToken, token)
    }

    func testSaveToken_WhenTokenIsEmpty_ShouldStoredTokenIsEmpty() {
        // Arrange
        let expectedToken = ""

        // Act
        sut.save(token: expectedToken)

        // Assert
        XCTAssertEqual(expectedToken, sut.token)
    }

    func testSaveToken_WhenTokenIsNotEmpty_ShouldStoredTokenIsNotEmpty() {
        // Arrange
        let expectedToken = "123456789"

        // Act
        sut.save(token: expectedToken)

        // Assert
        XCTAssertEqual(expectedToken, sut.token)
    }
}
