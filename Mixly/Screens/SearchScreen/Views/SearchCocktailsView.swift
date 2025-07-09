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
                CocktailListView(
                    cocktails: cocktailViewModel.cocktails,
                    searchString: $searchString,
                    submitSearch: { cocktailViewModel.searchCocktailsBy(string: $0) }
                )
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
