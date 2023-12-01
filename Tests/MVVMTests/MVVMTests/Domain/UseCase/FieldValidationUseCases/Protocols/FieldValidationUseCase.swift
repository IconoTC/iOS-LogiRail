//
//  FieldValidationUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol FieldValidationUseCase {
    func isValidField(_ field: String?) -> Bool
}
