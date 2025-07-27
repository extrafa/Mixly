//
//  Sheet+SearchByIngredientToolbar.swift
//  Mixly
//
//  Created by Ross on 25.07.2025.
//

import SwiftUI

struct IngredientsToolbar: ViewModifier {
    let searchAction: () -> Void
    let removeAction: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    searchButton()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    removeButton()
                }
            }
    }
    
    // Button to return cocktails filtered by ingredients
    func searchButton() -> some View {
        Button(action: searchAction) {
            Image(systemName: "magnifyingglass")
        }
    }
    
    // Button to remove all selected ingredients
    func removeButton() -> some View {
        Button(action: removeAction) {
            Label("clear", systemImage: "trash")
        }
    }
}

// Extension to use our SearchByIngredientToolBar how modifier on any View
extension View {
    func ingredientsToolbar(searchAction: @escaping () -> Void, removeAction: @escaping () -> Void) -> some View {
        self.modifier(IngredientsToolbar(searchAction: searchAction, removeAction: removeAction))
    }
}


