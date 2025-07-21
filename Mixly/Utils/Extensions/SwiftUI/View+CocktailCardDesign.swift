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
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            itemImageFor(url: cocktail.image ?? "notFound")
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    itemTextFor(name: cocktail.name ?? "Cocktail", alcoholic: cocktail.alcoholic ? "Alcoholic" : "Non-alcoholic")
                }
                Spacer()
                Image(systemName: cocktail.isFavourite ? "bookmark.fill" : "bookmark")
                    .onTapGesture {
                        toggleFavourite()
                    }
            }
            
            Spacer(minLength: 8)
            
            
        }
        .cardStyle()
    }
}
