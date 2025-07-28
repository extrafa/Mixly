//
//  IngredientCardView.swift
//  Mixly
//
//  Created by Ross on 22.07.2025.
//

import SwiftUI

struct IngredientCardView: View {
    @ObservedObject var ingredient: Ingredient
    @State private var isTapped: Bool = false
    @Binding var selectedIngredientsIDs: [Int]
    let imageSize: CGFloat = UIScreen.main.bounds.width < 400 ? 50 : 64
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            imageFrom(url: ingredient.image ?? "notFound", imageSize: imageSize)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    textFor(name: ingredient.name ?? "Ingredient", alcoholic: nil, instruction: nil)
                }
                Spacer()
                if selectedIngredientsIDs.contains(Int(ingredient.id)) {
                    Image(systemName: "checkmark")
                        .font(.title2)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                let id = Int(ingredient.id)
                if selectedIngredientsIDs.contains(id) {
                    selectedIngredientsIDs.removeAll { $0 == id }
                } else {
                    selectedIngredientsIDs.append(id)
                }
            }
            Spacer(minLength: 8)
        }
        .cardStyle()
        .onTapGesture {
            isTapped.toggle()
        }
    }
}
