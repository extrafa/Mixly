//
//  FavouritesCocktailsView.swift
//  Mixly
//
//  Created by Ross on 20.07.2025.
//

import SwiftUI

struct FavouritesCocktailsView: View {
    @StateObject private var favouriteViewModel = FavouriteCocktailViewModel()
    @State private var searchString = ""
    var body: some View {
        NavigationStack {
            ZStack {
                CocktailListView(cocktails: favouriteViewModel.cocktails)
            }
            .navigationTitle("My cocktails")
        }
    }
}

#Preview {
    FavouritesCocktailsView()
}
