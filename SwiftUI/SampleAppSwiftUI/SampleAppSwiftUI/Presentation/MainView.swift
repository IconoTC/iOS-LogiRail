//
//  MainView.swift
//  SampleAppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelected = 0

    var body: some View {
        NavigationView {
            TabView(selection: $tabSelected) {
                TabListView(
                    items: map(students: defaultStudents)
                )
                .tabItem {
                    Image("ic_tab_students")
                    Text("Students")
                }
                .tag(0)

                TabListView(
                    items: map(teachers: defaultTeachers)
                )
                .tabItem {
                    Image("ic_tab_teachers")
                    Text("Teachers")
                }
                .tag(1)

                TabListView(
                    items: map(subjects: defaultSubjects)
                )
                .tabItem {
                    Image("ic_tab_subjects")
                    Text("Subjects")
                }
                .tag(2)
            }
            .navigationTitle(title(for: tabSelected))
        }
    }

    private func title(for selection: Int) -> String {
        switch selection {
            case 0, 1, 2: "Tab \(selection)"
            default: ""
        }
    }

    private func map(students: Students) -> Items {
        students.map {
            .init(
                image: $0.avatar,
                title: $0.name,
                subtitle: $0.email
            )
        }
    }

    private func map(teachers: Teachers) -> Items {
        teachers.map {
            .init(
                image: $0.avatar,
                title: $0.name,
                subtitle: $0.email
            )
        }
    }

    private func map(subjects: Subjects) -> Items {
        subjects.map {
            .init(
                image: $0.avatar,
                title: $0.name
            )
        }
    }
}

#Preview {
    MainView()
}
