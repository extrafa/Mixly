//
//  CocktailModel.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation

struct CocktailData: Codable {
    let cocktails: [CocktailModel]
    let categories: [CategoryModel]
    let ingredients: [IngredientModel]
    let glassTypes: [GlassTypeModel]
}

struct CocktailModel: Codable {
    let id: Int
    let name: String
    let categoryId: Int
    let glassTypeId: Int
    let alcoholic: Bool
    let instructions: String
    let image: String
    let ingredientIds: [Int]

    enum CodingKeys: String, CodingKey {
        case id, name, alcoholic, instructions, image
        case categoryId = "category_id"
        case glassTypeId = "glass_type_id"
        case ingredientIds = "ingredient_ids"
    }
}

struct CategoryModel: Codable {
    let id: Int
    let label: String
}

struct IngredientModel: Codable {
    let id: Int
    let name: String
    let type: String
    let containsAlcohol: Bool
    let abv: Int?
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, name, type, image
        case containsAlcohol = "contains_alcohol"
        case abv = "ABV"
    }
}

struct GlassTypeModel: Codable {
    let id: Int
    let label: String
}
