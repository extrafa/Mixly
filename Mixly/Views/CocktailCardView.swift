//
//  CocktailCardView.swift
//  Mixly
//
//  Created by Ross on 23.06.2025.
//

import SwiftUI

struct CocktailCardView: View {
    let imageURL: String
    let name: String
    let alcoholic: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            itemImageFor(url: imageURL)
            
            VStack(alignment: .leading, spacing: 4) {
                itemTextFor(name: name, alcoholic: alcoholic ? "Alcoholic" : "Non-alcoholic")
            }
            
            Spacer(minLength: 8)
            
            
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

extension CocktailCardView {
    
    private var imageSize: CGFloat {
        UIScreen.main.bounds.width < 400 ? 50 : 64
    }
    
    func itemImageFor(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
        }
    }
    
    func itemTextFor(name: String, alcoholic: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(.headline)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
            
            Text(alcoholic)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
    }
    
}


#Preview {
    CocktailCardView(
        imageURL: "https://boozeapi.com/api/img/cocktails/150.jpg",
        name: "Old Fashioned",
        alcoholic: true
    )
    .padding()
}
