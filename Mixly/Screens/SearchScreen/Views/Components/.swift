//
//  AddIngredientToolbar.swift
//  Mixly
//
//  Created by Ross on 06.07.2025.
//

import SwiftUI

struct AddIngredientToolbar: ViewModifier {
    var action: () -> Void
    
    var body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    addIngredientButton()
                }
            }
    }
}

#Preview {
    AddIngredientToolbar()
}
