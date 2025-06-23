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
                cocktailList()
                categoryList()
            }
        }
    }
}

extension SearchCocktailsView {
    
    func cocktailList() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(cocktailViewModel.cocktails) { cocktail in
                    CocktailCardView(
                        imageURL: cocktail.image ?? "Image",
                        name: cocktail.name ?? "Name",
                        alcoholic: cocktail.alcoholic)
                }
            }
        }
        .searchable(text: $searchString, prompt: "Search Cocktails")
        .onSubmit(of: .search) { cocktailViewModel.searchCocktailsBy(string: searchString) }
    }
    
    func categoryList() -> some View {
        Group {
            if cocktailViewModel.isCaterogyShow {
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
    }
    
}

#Preview {
    SearchCocktailsView()
}
