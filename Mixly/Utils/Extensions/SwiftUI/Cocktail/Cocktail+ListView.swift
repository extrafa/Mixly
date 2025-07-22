//
//  SearchCocktailListView.swift
//  Mixly
//
//  Created by Ross on 21.07.2025.
//

import SwiftUI

struct SearchCocktailListView: View {
    @ObservedObject var viewModel: CocktailViewModel
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
