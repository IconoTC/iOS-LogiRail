//
//  DetailView.swift
//  MVVMSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var router: NavigationRouter
    @ObservedObject var state: DetailState

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            headerImage

            Text(state.title)
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity,
                       alignment: .leading)

            Text(state.description)
                .font(.footnote)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
        .onAppear {
            state.onViewAppear(router: router)
        }
        .padding(20)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top)
    }

    private var headerImage: some View {
        ZStack(alignment: .topLeading) {
            Image(state.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(height: 320)

            Button {
                state.onBackPressed()
            } label: {
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(Color.gray.opacity(0.2))
                    .overlay {
                        Text("<")
                            .font(.headline)
                            .foregroundStyle(.black)
                    }
            }
            .frame(width: 45,
                   height: 45)
        }
    }
}

#Preview {
    DetailView(
        state: .init(
            character: .init(
                name: "Bart Simpson",
                job: "Estudiante en la Escuela primaria de Springfield",
                image: "bart_simpson",
                description: "Conocido como El Barto y Bartman , es el hijo mayor travieso, rebelde, incomprendido y potencialmente peligroso de Homer y Marge Simpson, y el hermano de Lisa y Maggie Simpson"
            )
        )
    )
    .environmentObject(NavigationRouter(navStack: .init()))
}
