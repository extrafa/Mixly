//
//  IngredientCardView.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

struct IngredientCardView: View {
    @ObservedObject var ingredient: Ingredient
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            itemImageFor(url: ingredient.image ?? "notFound")
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    itemTextFor(name: ingredient.name ?? "Ingredient")
                }
                Spacer()
            }
            Spacer(minLength: 8)
        }
        .cardStyle()
    }
}
