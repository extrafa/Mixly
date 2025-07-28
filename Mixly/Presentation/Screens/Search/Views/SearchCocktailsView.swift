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
                CocktailsListView(
                    cocktails: viewModel.cocktails,
                    toggleFavourite: { viewModel.toggleIsFavourite(cocktail: $0) }
                )
                .searchable(text: $searchString, prompt: "Search cocktails")
                .onSubmit(of: .search) {
                    viewModel.searchCocktailsBy(string: searchString)
                }
                
                CategoryGridView(
                    categories: viewModel.categories,
                    isCaterogyShow: viewModel.isCategoryPresented,
                    loadCategories: { viewModel.loadAllCategories() }
                )
            }
            .cocktailsToolbar(
                ingredientAction: { isPresented.toggle() },
                categoriesAction: { viewModel.returnCategories() },
                isCategoriesPresented: $viewModel.isCategoryPresented
            )
            .bottomSheetView(
                isPresented: $isPresented,
                viewModel: viewModel,
                selectedIngredients: $selectedIngredientIDs)
        }
    }
}

#Preview {
    SearchCocktailsView()
}
