//
//  FavouritesCocktailsView.swift
//  Mixly
//
//  Created by Ross on 20.07.2025.
//

import SwiftUI

struct FavouritesCocktailsView: View {
    @StateObject private var viewModel = FavouritesViewModel()
    @State private var searchString = ""
    var body: some View {
        NavigationStack {
            ZStack {
                CocktailsListView(
                    cocktails: viewModel.cocktails,
                    toggleFavourite: { viewModel.toggleIsFavourite(cocktail: $0) }
                )
            }
            .navigationTitle("My cocktails")
            .task {
                viewModel.loadFavouritesCocktails()
            }
        }
    }
}

#Preview {
    FavouritesCocktailsView()
}
