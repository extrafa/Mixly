//
//  FavouriteCocktailListView.swift
//  Mixly
//
//  Created by Ross on 21.07.2025.
//

import SwiftUI

struct FavouriteCocktailListView: View {
    @ObservedObject var viewModel: FavouriteCocktailViewModel
    let cocktails: [Cocktail]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(cocktails) { cocktail in
                    CocktailCardView(
                        cocktail: cocktail,
                        toggleFavourite: { viewModel.toggleIsFavourite(cocktail: cocktail) }
                    )
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        
    }
}
