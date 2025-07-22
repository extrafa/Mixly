//
//  AddIngredientView.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

struct AddIngredientView: View {
    @StateObject private var cocktailViewModel = CocktailViewModel()
    @State private var searchString: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                IngredientListView(
                    viewModel: cocktailViewModel,
                    ingredients: cocktailViewModel.ingredients
                )
            }
            .navigationTitle("Search ingredient")
            .searchable(text: $searchString, prompt: "Search ingredients")
            .onSubmit(of: .search) { cocktailViewModel.searchIngredientsBy(string: searchString) }
        }
    }
}

#Preview {
    AddIngredientView()
}
