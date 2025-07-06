//
//  CocktailDataModel.swift
//  Mixly
//
//  Created by Ross on 06.07.2025.
//

import Foundation

struct CocktailData: Codable {
    let cocktails: [CocktailModel]
    let categories: [CategoryModel]
    let ingredients: [IngredientModel]
    let glassTypes: [GlassTypeModel]
}
