//
//  KeychainSwiftSecureStoreProviderTests.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
import KeychainSwift
@testable import MVVMTests

final class KeychainSwiftSecureStoreProviderTests: XCTestCase {
    private var sut: SecureStoreProvider!

    override func setUp() {
        super.setUp()
        sut = KeychainSwift()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSet_WhenValueNotSet_ShouldStoredValueIsNil() {
        // Arrange
        let expectedValue: String? = nil
        let expectedKey = "KEY_NIL"

        // Act
        let value = sut.get(expectedKey)

        // Assert
        XCTAssertEqual(expectedValue, value)
    }

    func testSet_WhenValueIsEmpty_ShouldStoredValueIsEmpty() {
        // Arrange
        let expectedValue = ""
        let expectedKey = "KEY_EMPTY"

        // Act
        sut.set(expectedValue, forKey: expectedKey)
        let value = sut.get(expectedKey)

        // Assert
        XCTAssertEqual(expectedValue, value)
    }

    func testSet_WhenValueIsNotEmpty_ShouldStoredValueIsNotEmpty() {
        // Arrange
        let expectedValue = "12345678"
        let expectedKey = "KEY_DATA"

        // Act
        sut.set(expectedValue, forKey: expectedKey)
        let value = sut.get(expectedKey)

        // Assert
        XCTAssertEqual(expectedValue, value)
    }
}
