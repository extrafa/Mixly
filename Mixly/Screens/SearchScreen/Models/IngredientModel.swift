//
//  IngredientModel.swift
//  Mixly
//
//  Created by Ross on 06.07.2025.
//

import Foundation

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
