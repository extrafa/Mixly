//
//  View+AddIngredientToolbar.swift
//  Mixly
//
//  Created by Ross on 06.07.2025.
//

import SwiftUI

struct AddIngredientToolbar: ViewModifier {
    var action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: action) {
                        Image(systemName: "plus")
                    }
                }
            }
    }
}

extension View {
    func addIngredientToolbar(action: @escaping () -> Void) -> some View {
        self.modifier(AddIngredientToolbar(action: action))
    }
}
