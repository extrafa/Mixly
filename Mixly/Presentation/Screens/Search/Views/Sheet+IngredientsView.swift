//
//  Sheet+AddIngredient.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

struct IngredientSheetView: ViewModifier {
    @ObservedObject var viewModel: CocktailViewModel
    @Binding var isPresented: Bool
    @Binding var selectedIngredients: [Int]
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                AddIngredientView(viewModel: viewModel, selectedIngredients: $selectedIngredients)
                    .presentationDetents([.large])
                    .presentationDragIndicator(.hidden)
            }
    }
}

extension View {
    func bottomSheetView(
        isPresented: Binding<Bool>,
        viewModel: CocktailViewModel,
        selectedIngredients: Binding<[Int]>
    ) -> some View {
        self.modifier(
            IngredientSheetView(
                viewModel: viewModel,
                isPresented: isPresented,
                selectedIngredients: selectedIngredients
            )
        )
    }
}
