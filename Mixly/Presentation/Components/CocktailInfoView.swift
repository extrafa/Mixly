//
//  CocktailInfoView.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

struct CocktailInfoView: View {
    @ObservedObject var cocktail: Cocktail
    let imageSize: CGFloat = UIScreen.main.bounds.width < 400 ? 250 : 320
    
    var ingredients: [Ingredient] {
        cocktail.ingredients?.allObjects as? [Ingredient] ?? []
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 16) {
                imageFrom(url: cocktail.image ?? "notFound", imageSize: imageSize)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        textFor(name: cocktail.name ?? "Cocktail", alcoholic: cocktail.alcoholic ? "Alcoholic" : "Non-alcoholic", instruction: cocktail.instructions ?? "Instruction")
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(ingredients) { ingredient in
                                IngredientCapsule(ingredient: ingredient)
                            }
                        }
                    }
                    .clipped()
                }
                .padding()
            }
            .cardStyle()
            .padding(.horizontal, 16)
        }
    }
}
