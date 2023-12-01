//
//  PasswordValidationUseCaseTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

import XCTest
@testable import MVVMTests

final class PasswordValidationUseCaseTests: XCTestCase {
    private var sut: FieldValidationUseCase!

    override func setUp() {
        super.setUp()
        sut = PasswordValidationUseCase()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testIsValidPassword_WhenPasswordIsEmpty_ShouldReturnFalse() {
        // Arrange
        let expectedPassword = ""

        // Act
        let validation = sut.isValidField(expectedPassword)

        // Assert
        XCTAssertFalse(validation)
    }

    func testIsValidPassword_WhenPasswordIsNil_ShouldReturnFalse() {
        // Arrange
        let expectedPassword: String? = nil

        // Act
        let validation = sut.isValidField(expectedPassword)

        // Assert
        XCTAssertFalse(validation)
    }

    func testIsValidPassword_WhenPasswordIsNotValid_ShouldReturnFalse() {
        // Arrange
        let expectedPassword = "123"

        // Act
        let validation = sut.isValidField(expectedPassword)

        // Assert
        XCTAssertFalse(validation)
    }

    func testIsValidPassword_WhenPasswordIsValid_ShouldReturnTrue() {
        // Arrange
        let expectedPassword = "1234abcd"

        // Act
        let validation = sut.isValidField(expectedPassword)

        // Assert
        XCTAssertTrue(validation)
    }
}
