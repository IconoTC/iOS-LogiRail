//
//  TestsSecureStoreProvider.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 28/11/23.
//

import XCTest
@testable import MVVMTests

class TestSecureStoreProvider: SecureStoreProvider {
    private var lastData: [String: String] = [:]

    func set(_ value: String, forKey key: String) -> Bool {
        lastData[key] = value
        return true
    }

    func get(_ key: String) -> String? {
        lastData[key]
    }
}
