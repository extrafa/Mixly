//
//  CocktailService.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation

protocol CocktailService {
    func loadFilteredCocktailsBy(ids: [Int]) -> [Cocktail]
}
