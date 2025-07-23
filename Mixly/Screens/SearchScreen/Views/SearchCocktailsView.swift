//
//  SearchCocktailsView.swift
//  Mixly
//
//  Created by Ross on 22.06.2025.
//

import SwiftUI

struct SearchCocktailsView: View {
    @StateObject private var viewModel = CocktailViewModel()
    @State private var searchString = ""
    @State private var isPresented: Bool = false
    @State private var selectedIngredientIDs: [Int] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                CocktailListView(
                    cocktails: viewModel.cocktails,
                    toggleFavourite: { viewModel.toggleIsFavourite(cocktail: $0) }
                )
                .searchable(text: $searchString, prompt: "Search cocktails")
                .onSubmit(of: .search) { viewModel.searchCocktailsBy(string: searchString) }
                
                CategoryListView(
                    cocktails: viewModel.cocktails,
                    categories: viewModel.categories,
                    isCaterogyShow: viewModel.isCaterogyShow,
                    loadCategories: { viewModel.loadAllCategories() }
                )
            }
            .addIngredientToolbar { isPresented.toggle() }
            .bottomSheetView(
                isPresented: $isPresented,
                content: { AddIngredientView(cocktailViewModel: viewModel, selectedIngredients: $selectedIngredientIDs) }
            )
        }
    }
}

#Preview {
    SearchCocktailsView()
}
