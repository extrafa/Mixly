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
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                SearchCocktailListView(viewModel: CocktailViewModel(), cocktails: cocktailViewModel.cocktails)
                .searchable(text: $searchString, prompt: "Search cocktails")
                .onSubmit(of: .search) { cocktailViewModel.searchCocktailsBy(string: searchString) }
                CategoryListView(
                    cocktails: cocktailViewModel.cocktails,
                    categories: cocktailViewModel.categories,
                    isCaterogyShow: cocktailViewModel.isCaterogyShow,
                    loadCategories: { cocktailViewModel.loadAllCategories() }
                )
            }
            .addIngredientToolbar { isPresented.toggle() }
            .bottomSheetView(isPresented: $isPresented, content: { AddIngredientView()})
        }
    }
}

#Preview {
    SearchCocktailsView()
}
