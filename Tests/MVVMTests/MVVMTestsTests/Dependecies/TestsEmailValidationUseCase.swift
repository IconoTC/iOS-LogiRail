//
//  TestsEmailValidationUseCase.swift
//  MVVMTestsTests
//
//  Created by David Jardon on 29/11/23.
//

@testable import MVVMTests

class TestsEmailValidationUseCase: FieldValidationUseCase {
    var isValidEmailResult = false

    func isValidField(_ field: String?) -> Bool {
        isValidEmailResult
    }
}
