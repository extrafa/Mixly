//
//  IngredientCapsule.swift
//  Mixly
//
//  Created by Ross on 29.07.2025.
//

import SwiftUI

struct IngredientCapsule: View {
    let ingredient: Ingredient
    var body: some View {
        Text(ingredient.name ?? "Error")
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(.thinMaterial)
            .clipShape(Capsule())
            .font(.caption)
    }
}

