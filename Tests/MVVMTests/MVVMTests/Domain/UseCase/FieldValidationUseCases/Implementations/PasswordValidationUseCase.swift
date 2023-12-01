//
//  PasswordValidationUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

final class PasswordValidationUseCase: FieldValidationUseCase {
    func isValidField(_ field: String?) -> Bool {
        field?.isEmpty == false && (field?.count ?? 0) >= 4
    }
}
