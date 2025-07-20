//
//  CategoryCocktailListView.swift
//  Mixly
//
//  Created by Ross on 12.07.2025.
//

import SwiftUI

struct CategoryCocktailListView: View {
    @StateObject private var viewModel = CocktailViewModel()
    let category: Category
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.cocktails) { cocktail in
                    CocktailCardView(
                        cocktail: cocktail,
                        toggleFavourite: { viewModel.toggleIsFavourite(cocktail: cocktail) }
                    )
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .onAppear {
            viewModel.loadCocktailsByCategory(category: category.label ?? "Error")
        }
    }
}
