//
//  Teacher.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import Foundation

typealias Teachers = [Teacher]

struct Teacher {
    enum TeacherType: String {
        case intern = "Intern"
        case extern = "Extern"
    }

    var name: String
    var avatar: String?
    var email: String?
    var birthdate: Date?
    var type: TeacherType?
}
