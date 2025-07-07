//
//  CategoryCardListView.swift
//  Mixly
//
//  Created by Ross on 06.07.2025.
//

import SwiftUI

struct CategoryCardListView: View {
    let categories: [Category]
    let isCategoryShow: Bool
    let loadCategories: () -> Void
    
    var body: some View {
        if isCategoryShow {
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
