//
//  View+CategoryList.swift
//  Mixly
//
//  Created by Ross on 08.07.2025.
//

import SwiftUI

struct CategoryListView: View {
    let categories: [Category]
    let isCaterogyShow: Bool
    let loadCategories: () -> Void
    
    var body: some View {
        Group {
            if isCaterogyShow {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(categories) { category in
                            CategoryCardView(
                                title: category.label ?? "Unknown",
                                colors: [.green, .mint]
                            )
                        }
                    }
                    .padding()
                }
                .task { loadCategories() }
            }
        }
    }
}
