//
//  SearchCocktailListView.swift
//  Mixly
//
//  Created by Ross on 21.07.2025.
//

import SwiftUI

struct CocktailListView: View {
    let cocktails: [Cocktail]
    let toggleFavourite: (Cocktail) -> Void
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(cocktails) { cocktail in
                    NavigationLink {
                        Text(cocktail.instructions ?? "Some error")
                    } label: {
                        CocktailCardView(
                            cocktail: cocktail,
                            toggleFavourite: { toggleFavourite(cocktail) }
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        
    }
}
