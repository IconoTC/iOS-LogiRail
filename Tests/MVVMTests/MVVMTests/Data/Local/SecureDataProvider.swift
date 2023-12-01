//
//  SecureDataProvider.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol SecureDataProvider {
    var token: String? { get }
    func save(token: String)
}

final class DefaultSecureDataProvider: SecureDataProvider {
    private let secureStoreProvider: SecureStoreProvider
    private enum Key {
        static let token = "KEY_TOKEN"
    }

    var token: String? {
        secureStoreProvider.get(Key.token)
    }

    init(secureStoreProvider: SecureStoreProvider) {
        self.secureStoreProvider = secureStoreProvider
    }

    func save(token: String) {
        secureStoreProvider.set(
            token,
            forKey: Key.token
        )
    }
}
