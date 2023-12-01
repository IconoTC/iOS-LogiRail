//
//  NavigationRouter.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI
import NavigationStack


enum NavigationType {
    case splash
    case main
    case detail
}

enum NavigationParameterKey: String {
    case character = "KEY_CHARACTER"
}

typealias NavigationParameters = [NavigationParameterKey: Any]

@MainActor
final class NavigationRouter: ObservableObject {
    let navStack: NavigationStackCompat

    init(navStack: NavigationStackCompat) {
        self.navStack = navStack
    }

    func back() {
        navStack.pop()
    }

    func push(to destination: NavigationType, with parameters: NavigationParameters? = nil) {
        switch destination {
            case .splash: pushToSplash()
            case .main: pushToMain()
            case .detail: pushToDetail(with: parameters)
        }
    }

    private func pushToSplash(with parameters: NavigationParameters? = nil) {
        navStack.push(
            SplashView(state: .init())
        )
    }

    private func pushToMain(with parameters: NavigationParameters? = nil) {
        navStack.push(
            MainView(
                state: .init(
                    getAllCharactersUseCase: MockGetAllCharactersUseCase()
                )
            )
        )
    }

    private func pushToDetail(with parameters: NavigationParameters? = nil) {
        guard let data = parameters?[.character] as? CharacterModel else { return }

        navStack.push(
            DetailView(state: .init(character: data))
        )
    }
}
