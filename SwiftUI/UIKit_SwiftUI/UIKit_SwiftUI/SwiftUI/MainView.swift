//
//  MainView.swift
//  UIKit_SwiftUI
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var state: MainState

    var body: some View {
        VStack {
            if state.showLoading {
                progressView
            } else {
                ZStack(alignment: .top) {
                    contentView
                    VStack {
                        Spacer()
                        actionView
                    }
                }
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(Color.pink)
    }

    private var progressView: some View {
        ProgressView()
            .scaleEffect(2)
            .tint(.white)
    }

    private var contentView: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(state.title)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(state.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundStyle(.white)
            }
            .padding(.top, 20)
            .padding(.bottom, 60)
            .padding(.horizontal, 16)
            .frame(alignment: .top)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
    }

    private var actionView: some View {
        Button {

        } label: {
            HStack {
                Text("Next")
                Image(systemName: "arrow.right")
            }
            .foregroundStyle(.black)
            .padding(12)
            .background(Color.white)
            .clipShape(Capsule())
        }
    }
}

#Preview {
    MainView(state: .init())
}
