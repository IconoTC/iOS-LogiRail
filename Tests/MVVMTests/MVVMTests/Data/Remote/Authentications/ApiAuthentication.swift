//
//  ApiAuthentication.swift
//  MVVMTests
//
//  Created by David Jardon on 28/11/23.
//

import Foundation

protocol ApiAuthentication {
    var authentication: String { get }
    var type: ApiAuthenticationType { get }
}
