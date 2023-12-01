//
//  EmailValidationUseCaseTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
@testable import MVVMTests

final class EmailValidationUseCaseTests: XCTestCase {
    private var sut: FieldValidationUseCase!

    override func setUp() {
        super.setUp()
        sut = EmailValidationUseCase()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testIsValidEmail_WhenEmailIsEmpty_ShouldReturnFalse() {
        // Arrange
        let expectedEmail = ""

        // Act
        let validation = sut.isValidField(expectedEmail)

        // Assert
        XCTAssertFalse(validation)
    }

    func testIsValidEmail_WhenEmailIsNil_ShouldReturnFalse() {
        // Arrange
        let expectedEmail: String? = nil

        // Act
        let validation = sut.isValidField(expectedEmail)

        // Assert
        XCTAssertFalse(validation)
    }

    func testIsValidEmail_WhenEmailIsNotValid_ShouldReturnFalse() {
        // Arrange
        let expectedEmail = "djardongmail.com"

        // Act
        let validation = sut.isValidField(expectedEmail)

        // Assert
        XCTAssertFalse(validation)
    }

    func testIsValidEmail_WhenEmailIsValid_ShouldReturnTrue() {
        // Arrange
        let expectedEmail = "d.jardon@gmail.com"

        // Act
        let validation = sut.isValidField(expectedEmail)

        // Assert
        XCTAssertTrue(validation)
    }
}
