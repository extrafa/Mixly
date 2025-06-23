//
//  CategoryCardView.swift
//  Mixly
//
//  Created by Ross on 22.06.2025.
//

import SwiftUI

struct CategoryCardView: View {
    let title: String
    let iconName: String
    let colors: [Color]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            categoryCardInfo(iconName: iconName, title: title)
        }
        .padding()
        .frame(width: 150, height: 100)
        .background(
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

extension CategoryCardView {
    
    func categoryCardInfo(iconName: String, title: String) -> some View {
        Group {
            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
    }
    
}


#Preview {
    CategoryCardView(
        title: "Non-alcoholic",
        iconName: "leaf.fill",
        colors: [.green, .mint]
    )
}
