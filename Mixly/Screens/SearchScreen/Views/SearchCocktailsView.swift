//
//  SearchCocktailsView.swift
//  Mixly
//
//  Created by Ross on 22.06.2025.
//

import SwiftUI

struct SearchCocktailsView: View {
    @StateObject private var cocktailViewModel = CocktailViewModel()
    @State private var searchString = ""
    var body: some View {
        NavigationStack {
            ZStack {
                CocktailListView(
                    cocktails: cocktailViewModel.cocktails,
                    searchString: $searchString,
                    submitSearch: { cocktailViewModel.searchCocktailsBy(string: $0) }
                )
                CategoryListView(
                    cocktails: cocktailViewModel.cocktails,
                    categories: cocktailViewModel.categories,
                    isCaterogyShow: cocktailViewModel.isCaterogyShow,
                    loadCategories: { cocktailViewModel.loadAllCategories() }
                )
            }
            .addIngredientToolbar { /* Future logic */ }
        }
    }
}

#Preview {
    SearchCocktailsView()
}
