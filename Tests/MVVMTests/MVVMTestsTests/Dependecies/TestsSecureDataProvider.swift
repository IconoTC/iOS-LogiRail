//
//  TestsSecureDataProvider.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
@testable import MVVMTests

final class TestsSecureDataProvider: SecureDataProvider {
    var lastSavedToken: String?

    var token: String? {
        lastSavedToken
    }

    func save(token: String) {
        lastSavedToken = token
    }
}
