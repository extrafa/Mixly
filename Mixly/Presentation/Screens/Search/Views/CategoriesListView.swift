//
//  CategoryCocktailListView.swift
//  Mixly
//
//  Created by Ross on 12.07.2025.
//

import SwiftUI

struct CategoriesCocktailListView: View {
    @StateObject private var viewModel = CocktailViewModel()
    let category: Category
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.cocktails) { cocktail in
                    CocktailsListView(
                        cocktails: viewModel.cocktails,
                        toggleFavourite: { viewModel.toggleIsFavourite(cocktail: $0) }
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
