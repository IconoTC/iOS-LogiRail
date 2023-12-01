//
//  MainState.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

@MainActor
final class MainState: ObservableObject {
    private let getAllCharactersUseCase: GetAllCharactersUseCase

    @Published var characters: CharactersModel = []

    private var router: NavigationRouter?


    init(getAllCharactersUseCase: GetAllCharactersUseCase) {
        self.getAllCharactersUseCase = getAllCharactersUseCase
    }

    func onViewAppear(router: NavigationRouter) {
        self.router = router
        loadData()
    }

    func onCharacterPressed(_ character: CharacterModel) {
        router?.push(
            to: .detail,
            with: [.character: character]
        )
    }

    private func loadData() {
        characters = getAllCharactersUseCase.characters
    }
}
