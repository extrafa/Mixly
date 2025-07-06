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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    addIngredientButton()
                }
            }
        }
    }
}

extension SearchCocktailsView {
    
    func cocktailList() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(cocktailViewModel.cocktails) { cocktail in
                    CocktailCardView(
                        imageURL: cocktail.image ?? "Image",
                        name: cocktail.name ?? "Name",
                        alcoholic: cocktail.alcoholic)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
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
    
    func addIngredientButton() -> some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
        }
    }
    
}

#Preview {
    SearchCocktailsView()
}
