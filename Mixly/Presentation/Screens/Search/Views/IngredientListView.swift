//
//  IngredientListView.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//
import SwiftUI

struct IngredientListView: View {
    @ObservedObject var viewModel: CocktailViewModel
    let ingredients: [Ingredient]
    @Binding var selectedIngredients: [Int]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(ingredients) { ingredient in
                    IngredientCardView(ingredient: ingredient, selectedIngredientsIDs: $selectedIngredients)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        
    }
}
