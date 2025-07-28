//
//  CocktailCardView.swift
//  Mixly
//
//  Created by Ross on 23.06.2025.
//

import SwiftUI

struct CocktailCardView: View {
    @ObservedObject var cocktail: Cocktail
    let toggleFavourite: () -> Void
    let imageSize: CGFloat = UIScreen.main.bounds.width < 400 ? 50 : 64
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            imageFrom(url: cocktail.image ?? "notFound", imageSize: imageSize)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    textFor(name: cocktail.name ?? "Cocktail", alcoholic: cocktail.alcoholic ? "Alcoholic" : "Non-alcoholic", instruction: nil)
                }
                Spacer()
                Image(systemName: cocktail.isFavourite ? "bookmark.fill" : "bookmark")
                    .font(.title2)
                    .onTapGesture {
                        toggleFavourite()
                    }
            }
            Spacer(minLength: 8)
        }
        .cardStyle()
    }
}
