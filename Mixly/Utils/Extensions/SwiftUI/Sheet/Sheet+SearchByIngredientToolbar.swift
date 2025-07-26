//
//  Sheet+SearchByIngredientToolbar.swift
//  Mixly
//
//  Created by Ross on 25.07.2025.
//

import SwiftUI

struct SearchByIngredientToolbar: ViewModifier {
    let searchAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    searchByIngredientButton()
                }
            }
    }
    
    // Button to return cocktails filtered by ingredients
    func searchByIngredientButton() -> some View {
        Button(action: searchAction) {
            Image(systemName: "magnifyingglass")
        }
    }
}

// Extension to use our SearchByIngredientToolBar how modifier on any View
extension View {
    func searchByIngredient(searchAction: @escaping () -> Void) -> some View {
        self.modifier(SearchByIngredientToolbar(searchAction: searchAction))
    }
}


