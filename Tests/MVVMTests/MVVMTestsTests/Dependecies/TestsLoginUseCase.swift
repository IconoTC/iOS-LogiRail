//
//  TestsLoginUseCase.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

@testable import MVVMTests

final class TestsLoginUseCase: LoginUseCase {
    var loginResult = false

    func login(user: String, password: String) async -> Bool {
        loginResult
    }
}
