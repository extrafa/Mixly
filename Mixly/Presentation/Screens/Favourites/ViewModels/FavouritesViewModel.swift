//
//  FavouriteCocktailViewModel.swift
//  Mixly
//
//  Created by Ross on 20.07.2025.
//

import Foundation

@MainActor
final class FavouritesViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = .init()
    
    let cocktailService: CocktailService
    
    init(cocktailService: CocktailService = BaseCocktailService()) {
        self.cocktailService = cocktailService
    }
    
    // MARK: - Favourites
    
    func loadFavouritesCocktails() {
        cocktails = cocktailService.loadFavouritesCocktails()
    }
    
    func toggleIsFavourite(cocktail: Cocktail) {
        cocktailService.toggleCocktailFavourite(cocktail: cocktail)
        loadFavouritesCocktails()
    }
    
}
