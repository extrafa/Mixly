//
//  SearchCocktailsView.swift
//  Mixly
//
//  Created by Ross on 22.06.2025.
//

import SwiftUI

struct SearchCocktailsView: View {
    @StateObject private var cocktailViewModel = CocktailViewModel()
    @State private var searchString = ""
    var body: some View {
        NavigationStack {
            ZStack {
                categoryList()
            }
        }
    }
}

extension SearchCocktailsView {
    
    func categoryList() -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(cocktailViewModel.categories) { category in
                    CategoryCardView(
                        title: category.label ?? "Unknown",
                        iconName: "leaf.fill",
                        colors: [.green, .mint]
                    )
                }
            }
            .padding()
        }
        .task {
            cocktailViewModel.loadAllCategories()
        }
    }
    
}

#Preview {
    SearchCocktailsView()
}
