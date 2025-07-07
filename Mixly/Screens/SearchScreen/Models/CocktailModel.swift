//
//  CocktailModel.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation

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
