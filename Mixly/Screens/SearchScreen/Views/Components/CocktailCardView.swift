//
//  CocktailCardView.swift
//  Mixly
//
//  Created by Ross on 23.06.2025.
//

import SwiftUI

struct CocktailCardView: View {
    let imageURL: String
    let name: String
    let alcoholic: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            itemImageFor(url: imageURL)
            
            VStack(alignment: .leading, spacing: 4) {
                itemTextFor(name: name, alcoholic: alcoholic ? "Alcoholic" : "Non-alcoholic")
            }
            
            Spacer(minLength: 8)
            
            
        }
        .cardStyle()
    }
}

#Preview {
    CocktailCardView(
        imageURL: "https://boozeapi.com/api/img/cocktails/150.jpg",
        name: "Old Fashioned",
        alcoholic: true
    )
    .padding()
}
