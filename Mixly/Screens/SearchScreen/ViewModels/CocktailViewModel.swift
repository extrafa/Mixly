//
//  CocktailViewModel.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import SwiftUI

@MainActor
final class CocktailViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = .init()
    @Published var ingredients: [Ingredient] = .init()
    @Published var categories: [Category] = .init()
    @Published var isCategoryPresented: Bool = true
    
    let cocktailService: CocktailService
    
    init(cocktailService: CocktailService = BaseCocktailService()) {
        self.cocktailService = cocktailService
    }
    
    // MARK: - Categories
    
    func loadAllCategories() {
        let allCategories = cocktailService.loadCategories()
        categories = allCategories.filter { $0.label?.lowercased() != "other / unknown" }
    }
    
    func loadCocktailsByCategory(category: String) {
        cocktails = cocktailService.loadCocktailsBy(category: category)
    }
    
    // MARK: - Search
    
    func searchCocktailsBy(string: String) {
        isCategoryPresented = false
        cocktails = cocktailService.loadCocktailsBy(string: string)
    }
    
    func searchIngredientsBy(string: String) {
        ingredients = cocktailService.loadIngredientsBy(string: string)
    }
    
    func searchCocktailsFilteredBy(ids: [Int]) {
        isCategoryPresented = false
        cocktails = cocktailService.loadFilteredCocktailsBy(ids: ids)
    }
    
    // MARK: - Favourites
    
    func toggleIsFavourite(cocktail: Cocktail) {
        cocktailService.toggleCocktailFavourite(cocktail: cocktail)
    }
    
    // MARK: - Return Categories
    
    func returnCategories() {
        cocktails.removeAll()
        isCategoryPresented = true
    }
    
}
