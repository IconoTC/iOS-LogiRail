//
//  MainView.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var router: NavigationRouter
    @ObservedObject var state: MainState

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(state.characters, id: \.name) { character in
                    MainCellView(image: character.image ?? "") {
                        state.onCharacterPressed(character)
                    }
                }
            }
        }
        .scrollIndicators(.never)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .onAppear {
            state.onViewAppear(router: router)
        }
    }
}

#Preview {
    MainView(
        state: .init(
            getAllCharactersUseCase: MockGetAllCharactersUseCase()
        )
    )
    .environmentObject(NavigationRouter(navStack: .init()))
}
