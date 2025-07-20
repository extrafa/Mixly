//
//  View+CocktailList.swift
//  Mixly
//
//  Created by Ross on 08.07.2025.
//

import SwiftUI

struct CocktailListView: View {
    let cocktails: [Cocktail]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(cocktails) { cocktail in
                    CocktailCardView(cocktail: cocktail)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        
    }
}

