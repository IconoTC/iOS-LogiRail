//
//  GetSampleData.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import Foundation

let defaultStudents: [Student] = [Student(name: "Óliver",
                                          avatar: "img_student_7",
                                          email: "oliver@gmail.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 2019,
                                                                                                month: 5))),
                                  Student(name: "Ángel",
                                          avatar: "img_student_2",
                                          email: "angel@gmail.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 2013,
                                                                                                month: 9))),
                                  Student(name: "Sara",
                                          avatar: "img_student_4",
                                          email: "sara@gmail.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1984,
                                                                                          month: 9))),
                                  Student(name: "Eduardo",
                                          avatar: "img_student_3",
                                          email: "eduardo@gmail.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1956,
                                                                                          month: 12))),
                                  Student(name: "María",
                                          avatar: "img_student_5",
                                          email: "maria@gmail.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1956,
                                                                                          month: 4))),
                                  Student(name: "Miguel",
                                          avatar: "img_student_6",
                                          email: "miguel@gmail.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                          month: 6))),
                                  Student(name: "Lucía",
                                          avatar: "img_student_1",
                                          email: "lucia@gmail.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                          month: 2)))]

let defaultTeachers: [Teacher] = [Teacher(name: "David",
                                          avatar: "img_teacher_3",
                                          email: "david@teacher.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1985,
                                                                                          month: 4)),
                                          type: .extern),
                                  Teacher(name: "Jaime",
                                          avatar: "img_teacher_2",
                                          email: "jaime@teacher.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1974,
                                                                                          month: 6)),
                                          type: .intern),
                                  Teacher(name: "Pedro",
                                          avatar: "img_teacher_4",
                                          email: "pedro@teacher.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1979,
                                                                                          month: 9)),
                                          type: .intern),
                                  Teacher(name: "Daniel",
                                          avatar: "img_teacher_5",
                                          email: "daniel@teacher.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1981,
                                                                                          month: 2)),
                                          type: .intern),
                                  Teacher(name: "Laura",
                                          avatar: "img_teacher_1",
                                          email: "laura@teacher.com",
                                          birthdate: Calendar.current.date(from: DateComponents(year: 1980,
                                                                                          month: 10)),
                                          type: .extern)]

let defaultSubjects: [Subject] = [Subject(name: "Android",
                                          avatar: "img_subject_android",
                                          year: Calendar.current.date(from: DateComponents(year: 2018,
                                                                                           month: 9)),
                                          teachers: defaultTeachers.filter{$0.name.contains("u")},
                                          students: defaultStudents.filter{$0.name.contains("a")}),
                                  Subject(name: "iOS",
                                          avatar: "img_subject_ios",
                                          year: Calendar.current.date(from: DateComponents(year: 2019,
                                                                                           month: 3)),
                                          teachers: defaultTeachers.filter{$0.name.contains("o")},
                                          students: defaultStudents.filter{$0.name.contains("e")}),
                                  Subject(name: "Python",
                                          avatar: "img_subject_python",
                                          year: Calendar.current.date(from: DateComponents(year: 2019,
                                                                                           month: 4)),
                                          teachers: defaultTeachers.filter{$0.name.contains("i")},
                                          students: defaultStudents.filter{$0.name.contains("i")}),
                                  Subject(name: "JavaScript",
                                          avatar: "img_subject_javascript",
                                          year: Calendar.current.date(from: DateComponents(year: 2018,
                                                                                           month: 10)),
                                          teachers: defaultTeachers.filter{$0.name.contains("e")},
                                          students: defaultStudents.filter{$0.name.contains("o")}),
                                  Subject(name: "Dart",
                                          avatar: "img_subject_dart",
                                          year: Calendar.current.date(from: DateComponents(year: 2018,
                                                                                           month: 9)),
                                          teachers: defaultTeachers.filter{$0.name.contains("a")},
                                          students: defaultStudents.filter{$0.name.contains("u")})]
