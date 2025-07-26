//
//  AddIngredientView.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

struct AddIngredientView: View {
    @ObservedObject var viewModel: CocktailViewModel
    @State private var searchString: String = ""
    @Binding var selectedIngredients: [Int]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            listOrEmpty()
                .searchByIngredient {
                    dismiss()
                    viewModel.searchCocktailsFilteredBy(ids: selectedIngredients)
                }
                .searchable(text: $searchString, prompt: "Search ingredients")
                .onSubmit(of: .search) {
                    viewModel.searchIngredientsBy(string: searchString)
                }
        }
    }
    
    // Display Ingredients list or "welcom view"
    @ViewBuilder
    private func listOrEmpty() -> some View {
        if viewModel.ingredients.isEmpty {
            ContentUnavailableView(
                "Search ingredients",
                systemImage: "magnifyingglass"
            )
        } else {
            IngredientListView(
                viewModel: viewModel,
                ingredients: viewModel.ingredients,
                selectedIngredients: $selectedIngredients
            )
        }
    }
    
}

#Preview {
    AddIngredientView(
        viewModel: CocktailViewModel(),
        selectedIngredients: .constant([1, 2, 3]))
}
