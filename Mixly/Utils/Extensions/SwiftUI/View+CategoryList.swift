//
//  View+CategoryList.swift
//  Mixly
//
//  Created by Ross on 08.07.2025.
//

import SwiftUI

struct CategoryListView: View {
    let cocktails: [Cocktail]
    let categories: [Category]
    let isCaterogyShow: Bool
    let loadCategories: () -> Void
    
    var body: some View {
        Group {
            if isCaterogyShow {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(categories, id: \.id) { category in
                            NavigationLink {
                                CategoryCocktailListView(category: category)
                            } label: {
                                CategoryCardView(
                                    title: category.label ?? "Unknown",
                                    colors: category.colors
                                )
                            }
                        }
                    }
                    .padding()
                }
                .task { loadCategories() }
            }
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
            return indices.contains(index) ? self[index] : nil
        }
}
