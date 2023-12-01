//
//  DetailState.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

@MainActor
final class DetailState: ObservableObject {
    @Published var image: String = ""
    @Published var title: String = ""
    @Published var description: String = ""

    private var router: NavigationRouter?
    private var character: CharacterModel


    init(character: CharacterModel) {
        self.character = character
    }

    func onViewAppear(router: NavigationRouter) {
        self.router = router
        image = character.image ?? ""
        title = character.name
        description = character.description ?? ""
    }

    func onBackPressed() {
        router?.back()
    }
}
