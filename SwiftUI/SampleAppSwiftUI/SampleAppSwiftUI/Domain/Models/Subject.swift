//
//  Subject.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import Foundation

typealias Subjects = [Subject]

struct Subject {
    let name: String
    let avatar: String?
    let year: Date?
    var teachers: Teachers = []
    var students: Students = []
}
