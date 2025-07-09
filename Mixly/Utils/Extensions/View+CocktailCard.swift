//
//  CocktailCard.swift
//  Mixly
//
//  Created by Ross on 08.07.2025.
//

import SwiftUI

// Image and text UI
extension CocktailCardView {
    
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
    
    func itemTextFor(name: String, alcoholic: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .textStyle(font: .headline, lineLimit: 1)
                .minimumScaleFactor(0.8)
            
            Text(alcoholic)
                .textStyle(font: .subheadline, lineLimit: 2)
                .lineLimit(2)
        }
    }
    
}

// Image style
extension Image {
    
    func imageStyle(imageSize: CGFloat = UIScreen.main.bounds.width < 400 ? 50 : 64) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: imageSize, height: imageSize)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }

}

// Text style
extension Text {
    
    func textStyle(font: Font, lineLimit: Int) -> some View {
        self
            .font(font)
            .lineLimit(lineLimit)
    }
    
}

// Card style
extension View {
    
    func cardStyle() -> some View {
        self
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
}
