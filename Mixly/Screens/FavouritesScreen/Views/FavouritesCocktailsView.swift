//
//  FavouritesCocktailsView.swift
//  Mixly
//
//  Created by Ross on 20.07.2025.
//

import SwiftUI

struct FavouritesCocktailsView: View {
    @StateObject private var cocktailViewModel = CocktailViewModel()
    @State private var searchString = ""
    var body: some View {
        NavigationStack {
            ZStack {
                CocktailListView(cocktails: cocktailViewModel.cocktails)
            }
        }
    }
}

#Preview {
    FavouritesCocktailsView()
}
