//
//  Ingredient+CardViewExtension.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

// Image and text UI
extension IngredientCardView {
    
    func itemImageFor(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Image("notFound")
                    .imageStyle()
            case .success(let image):
                image
                    .imageStyle()
            case .failure:
                Image("notFound")
                    .imageStyle()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func itemTextFor(name: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .textStyle(font: .headline, lineLimit: 1)
                .minimumScaleFactor(0.8)
        }
    }
    
}
