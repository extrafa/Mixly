//
//  AddIngredientToolBar.swift
//  Mixly
//
//  Created by Ross on 08.07.2025.
//

import SwiftUI

struct CocktailsToolBar: ViewModifier {
    let addIngredientAction: () -> Void
    let returnCategoriesAction: () -> Void
    @Binding var isCategoriesPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ingredientsButton()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    categoriesButton()
                }
            }
    }
    
    // BottomSheet button
    func ingredientsButton() -> some View {
        Button(action: addIngredientAction) {
            Image(systemName: "plus")
        }
    }
    
    // Button to return to categories
    func categoriesButton() -> some View {
        Group {
            if isCategoriesPresented == false {
                Button(action: returnCategoriesAction) {
                    Image(systemName: "chevron.left")
                }
            }
        }
    }
    
}

// Extension to use our AddIngredientToolBar how modifier on any View
extension View {
    func cocktailsToolbar(
        ingredientAction: @escaping () -> Void,
        categoriesAction: @escaping () -> Void,
        isCategoriesPresented: Binding<Bool>
    ) -> some View {
        self.modifier(
            CocktailsToolBar(
                addIngredientAction: ingredientAction,
                returnCategoriesAction: categoriesAction,
                isCategoriesPresented: isCategoriesPresented
            )
        )
    }
}
