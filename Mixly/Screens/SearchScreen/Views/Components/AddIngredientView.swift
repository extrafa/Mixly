//
//  AddIngredientView.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

struct AddIngredientView: View {
    @ObservedObject var cocktailViewModel: CocktailViewModel
    @State private var searchString: String = ""
    @Binding var selectedIngredients: [Int]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    IngredientListView(
                        viewModel: cocktailViewModel,
                        ingredients: cocktailViewModel.ingredients,
                        selectedIngredients: $selectedIngredients
                    )
                }
                .navigationTitle("Search ingredient")
                .searchable(text: $searchString, prompt: "Search ingredients")
                .onSubmit(of: .search) { cocktailViewModel.searchIngredientsBy(string: searchString) }
            }
            Button {
                dismiss()
                cocktailViewModel.searchCocktailsFilteredBy(ids: selectedIngredients)
            } label: {
                Text("Search")
            }
            .buttonStyle(.bordered)
        }
    }
}


