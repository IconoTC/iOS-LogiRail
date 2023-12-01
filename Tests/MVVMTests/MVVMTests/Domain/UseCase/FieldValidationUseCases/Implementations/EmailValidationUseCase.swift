//
//  EmailValidationUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class EmailValidationUseCase: FieldValidationUseCase {
    func isValidField(_ field: String?) -> Bool {
        field?.isEmpty == false && (field?.contains("@") ?? false)
    }
}
