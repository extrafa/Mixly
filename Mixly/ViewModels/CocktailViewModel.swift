//
//  CocktailViewModel.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation

@MainActor
final class CocktailViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = .init()
    @Published var ingredients: [Ingredient] = .init()
    @Published var categories: [Category] = .init()
    @Published var isFirstSearch: Bool = true
    
    let cocktailService: CocktailService
    
    init(cocktailService: CocktailService = BaseCocktailService()) {
        self.cocktailService = cocktailService
    }
    
    func loadAllCategories() {
        categories = cocktailService.loadCategories()
    }
    
    // MARK: - Search
    
    func searchCocktailsBy(string: String) {
        isFirstSearch = false
        cocktails = cocktailService.loadCocktailsBy(string: string)
    }
    
    func searchIngredientsBy(string: String) {
        ingredients = cocktailService.loadIngredientsBy(string: string)
    }
    
    func searchCocktailsFilteredBy(ids: [Int]) {
        cocktails = cocktailService.loadFilteredCocktailsBy(ids: ids)
    }
    
    // MARK: - Favourites
    
    func loadFavouritesCocktails() {
        cocktails = cocktailService.loadFavouritesCocktails()
    }
    
    func toggleIsFavourite(cocktail: Cocktail) {
        cocktailService.toggleCocktailFavourite(cocktail: cocktail)
    }
    
}
