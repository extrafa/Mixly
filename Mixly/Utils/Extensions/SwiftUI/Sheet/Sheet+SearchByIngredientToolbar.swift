//
//  Sheet+SearchByIngredientToolbar.swift
//  Mixly
//
//  Created by Ross on 25.07.2025.
//

import SwiftUI

struct SearchByIngredientToolbar: ViewModifier {
    let searchAction: () -> Void
    let removeAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    searchByIngredientButton()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    removeAllIngredientsButton()
                }
            }
    }
    
    // Button to return cocktails filtered by ingredients
    func searchByIngredientButton() -> some View {
        Button(action: searchAction) {
            Image(systemName: "magnifyingglass")
        }
    }
    
    // Button to remove all selected ingredients
    func removeAllIngredientsButton() -> some View {
        Button(action: removeAction) {
            Label("clear", systemImage: "trash")
        }
    }
}

// Extension to use our SearchByIngredientToolBar how modifier on any View
extension View {
    func searchByIngredient(searchAction: @escaping () -> Void, removeAction: @escaping () -> Void) -> some View {
        self.modifier(SearchByIngredientToolbar(searchAction: searchAction, removeAction: removeAction))
    }
}


