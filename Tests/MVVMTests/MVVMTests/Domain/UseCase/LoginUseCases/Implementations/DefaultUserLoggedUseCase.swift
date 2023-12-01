//
//  DefaultUserLoggedUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class DefaultUserLoggedUseCase: UserLoggedUseCase {
    private let secureDataProvider: SecureDataProvider

    init(secureDataProvider: SecureDataProvider) {
        self.secureDataProvider = secureDataProvider
    }

    var isUserLogged: Bool {
        !(secureDataProvider.token?.isEmpty ?? true)
    }
}
