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
            ZStack {
                VStack {
                    IngredientListView(
                        viewModel: viewModel,
                        ingredients: viewModel.ingredients,
                        selectedIngredients: $selectedIngredients
                    )
                }
                .navigationTitle("Search ingredient")
                .searchable(text: $searchString, prompt: "Search ingredients")
                .onSubmit(of: .search) { viewModel.searchIngredientsBy(string: searchString) }
            }
            Button {
                dismiss()
                viewModel.searchCocktailsFilteredBy(ids: selectedIngredients)
            } label: {
                Image(systemName: "magnifyingglass").font(.title)
            }
        }
    }
}

#Preview {
    AddIngredientView(
        viewModel: CocktailViewModel(),
        selectedIngredients: .constant([1, 2, 3]))
}
