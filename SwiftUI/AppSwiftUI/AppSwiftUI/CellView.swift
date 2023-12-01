//
//  CellView.swift
//  AppSwiftUI
//
//  Created by David Jardon on 30/11/23.
//

import SwiftUI

struct CellView: View {
    var data: String
    var onCellPressed: Binding<Bool>

    var body: some View {
        cellView(data)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .shadow(radius: 8)
    }

    private func cellView(_ data: String) -> some View {
        Button {
            onCellPressed.wrappedValue = true
        } label: {
            Text(data)
                .font(.caption)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
        }
    }
}

#Preview {
    VStack {
        CellView(
            data: "Cell 1 view binding",
            onCellPressed: .constant(false)
        )

        CellView(
            data: "Cell 2 view binding",
            onCellPressed: .constant(false)
        )
    }
    .padding()
}
