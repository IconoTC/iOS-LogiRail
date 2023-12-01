//
//  SecureStoreProvider.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation
import KeychainSwift

protocol SecureStoreProvider {
    @discardableResult
    func set(_ value: String, forKey key: String) -> Bool
    func get(_ key: String) -> String?
}

extension KeychainSwift: SecureStoreProvider {
    func set(_ value: String, forKey key: String) -> Bool {
        set(
            value,
            forKey: key,
            withAccess: nil
        )
    }
}
