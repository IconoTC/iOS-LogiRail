//
//  TestsPasswordValidationUseCase.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

@testable import MVVMTests

class TestsPasswordValidationUseCase: FieldValidationUseCase {
    var isValidPasswordResult = false

    func isValidField(_ field: String?) -> Bool {
        isValidPasswordResult
    }
}
