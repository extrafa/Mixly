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
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 16) {
                bigImageFrom(url: cocktail.image ?? "notFound")
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        itemTextFor(name: cocktail.name ?? "Cocktail", alcoholic: cocktail.alcoholic ? "Alcoholic" : "Non-alcoholic", instruction: cocktail.instructions ?? "Instruction")
                        Spacer()
                    }
                }
                .padding()
            }
            .cardStyle()
            .padding(.horizontal, 16)
        }
    }
}
