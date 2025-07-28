//
//  Cocktail+InfoViewExtension.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

// Image and text UI
extension CocktailInfoView {
    
    func bigImageFrom(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                Image("notFound")
                    .infoImageStyle()
            case .success(let image):
                image
                    .infoImageStyle()
            case .failure:
                Image("notFound")
                    .infoImageStyle()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func itemTextFor(name: String, alcoholic: String, instruction: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .infoTextStyle(font: .headline, lineLimit: 1)
                .minimumScaleFactor(0.8)
            
            Text(alcoholic)
                .infoTextStyle(font: .subheadline, lineLimit: 1)
            
            Text(instruction)
                .font(.body)
                .minimumScaleFactor(0.8)
                .padding(.vertical)
        }
    }
    
}

// Image style
extension Image {
    
    func infoImageStyle(imageSize: CGFloat = UIScreen.main.bounds.width < 400 ? 250 : 320) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: imageSize, height: imageSize)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }

}

// Text style
extension Text {
    
    func infoTextStyle(font: Font, lineLimit: Int) -> some View {
        self
            .font(font)
            .lineLimit(lineLimit)
    }
    
}
