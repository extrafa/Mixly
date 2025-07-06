//
//  CategoryCardView.swift
//  Mixly
//
//  Created by Ross on 22.06.2025.
//

import SwiftUI

struct CategoryCardView: View {
    let title: String
    let colors: [Color]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            categoryText(title: title)
        }
        .frame(width: 170, height: 100)
        .background(
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    func categoryText(title: String) -> some View {
        Group {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    CategoryCardView(
        title: "Shot",
        colors: [.green, .mint]
    )
}
