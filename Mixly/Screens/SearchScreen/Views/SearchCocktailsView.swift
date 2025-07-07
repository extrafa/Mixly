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
                    onSearch: { cocktailViewModel.searchCocktailsBy(string: $0) }
                )
                
                CategoryCardListView(
                    categories: cocktailViewModel.categories,
                    isCategoryShow: cocktailViewModel.isCaterogyShow,
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
