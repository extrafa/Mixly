//
//  CocktailInfoView.swift
//  Mixly
//
//  Created by Ross on 27.07.2025.
//

import SwiftUI

struct CocktailInfoView: View {
    @ObservedObject var cocktail: Cocktail
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            itemImageFor(url: cocktail.image ?? "notFound")
            
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        itemTextFor(name: cocktail.name ?? "Cocktail", alcoholic: cocktail.alcoholic ? "Alcoholic" : "Non-alcoholic", instruction: cocktail.instructions ?? "Instruction")
                        Spacer()
                    }
                }
                .padding()
        }
        .infoStyle()
        .padding(.horizontal, 16)
    }
}
