//
//  AddIngredientToolBar.swift
//  Mixly
//
//  Created by Ross on 08.07.2025.
//

import SwiftUI

struct AddIngredientToolBar: ViewModifier {
    let action: () -> Void
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    addIngredientButton()
                }
            }
    }
    func addIngredientButton() -> some View {
        Button(action: action) {
            Image(systemName: "plus")
        }
    }
}

extension View {
    func addIngredientToolbar(action: @escaping () -> Void ) -> some View {
        self.modifier(AddIngredientToolBar(action: action))
    }
}
