//
//  AppSwiftUIApp.swift
//  AppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

@main
struct AppSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppSwiftUIView()
        }
    }
}

struct AppSwiftUIView: View {
    var body: some View {
        ContentView(
            messageHStack: "Hello, horizontal world!",
            messageVStack: "Hello, vertical world!"
        )
    }
}
