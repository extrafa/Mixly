//
//  Ingredient+CardViewExtension.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

// Image and text UI
extension IngredientCardView {
    
    func itemTextFor(name: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .textStyle(font: .headline, lineLimit: 1)
                .minimumScaleFactor(0.8)
        }
    }
    
}
