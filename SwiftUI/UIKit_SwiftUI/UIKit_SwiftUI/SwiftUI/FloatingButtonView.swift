//
//  FloatingButtonView.swift
//  UIKit_SwiftUI
//
//  Created by David Jardon on 1/12/23.
//

import SwiftUI

struct FloatingButtonViewStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .frame(
                width: 45,
                height: 45,
                alignment: .center
            )
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.clear, lineWidth: 0)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                    )
                    .shadow(
                        color: .gray.opacity(0.4),
                        radius: 8,
                        x: 0,
                        y: 10
                    )
            )
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct FloatingButtonView: View {
    private var icon: Image
    private var onPressed: () -> Void

    init(
        icon: Image,
        onPressed: @escaping () -> Void
    ) {
        self.icon = icon
        self.onPressed = onPressed
    }

    var body: some View {
        Button {
            onPressed()
        } label: {
            icon
                .resizable()
                .renderingMode(.template)
        }
        .buttonStyle(FloatingButtonViewStyle())
    }
}

#Preview {
    FloatingButtonView(icon: Image(systemName: "arrow.right")) {

    }
}
