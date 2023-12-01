//
//  ContentView.swift
//  AppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct ContentView: View {
    var messageHStack: String
    var messageVStack: String

    private let data = ["David", "Sara", "Ángel", "Óliver", "Paula"]

    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            contentHStack
            contentAction
            contentListForEach()
            contentList()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Cell pressed"),
                message: Text("Custom alert shown"),
                dismissButton: .destructive(Text("Delete"))
            )
        }
    }

    private var contentHStack: some View {
        HStack {
            Image(systemName: "globe")
                .resizable()
                .foregroundStyle(.red)
                .scaledToFill()
                .frame(width: 40,
                       height: 40)
            Text(messageHStack)
                .font(.title)
                .lineLimit(1)
                .foregroundStyle(.indigo)
        }
    }

    private var contentAction: some View {
        Button {

        } label: {
            Text("Press me!")
                .foregroundStyle(.red)
        }
    }

    private func contentListForEach() -> some View {
        ScrollView {
            LazyVStack {
                ForEach(data, id: \.self) { person in
                    CellView(
                        data: person,
                        onCellPressed: $showAlert
                    )
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.never)
        .scrollBounceBehavior(.basedOnSize)
    }

    private func contentList() -> some View {
        List {
            ForEach(data, id: \.self) { person in
                CellView(
                    data: person,
                    onCellPressed: $showAlert
                )
            }
            .listRowSeparator(.visible)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView(
        messageHStack: "Hello, horizontal world!",
        messageVStack: "Hello, vertical world!"
    )
}
