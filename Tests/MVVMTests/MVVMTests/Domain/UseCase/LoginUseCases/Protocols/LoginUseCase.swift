//
//  LoginUseCase.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol LoginUseCase {
    func login(user: String, password: String) async -> Bool
}
