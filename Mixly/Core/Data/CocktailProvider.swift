//
//  CocktailProvider.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

final class CocktailProvider {
    
    static func importCocktailsToCoreData() {
        let context = PersistenceController.shared.context
        let userDefaults = UserDefaults.standard
        
        guard !userDefaults.bool(forKey: "isFirstLoading") else { return }
        guard let data = loadCocktailsData() else { return }
        
        // Category
        var categoryMap = [Int: Category]()
        for category in data.categories {
            let entity = Category(context: context)
            entity.id = Int64(category.id)
            entity.label = category.label
            categoryMap[category.id] = entity
        }
        
        // Glass type
        var glassTypeMap = [Int: GlassType]()
        for glassType in data.glassTypes {
            let entity = GlassType(context: context)
            entity.id = Int64(glassType.id)
            entity.label = glassType.label
            glassTypeMap[glassType.id] = entity
        }
        
        // Ingredients
        var ingredientMap = [Int: Ingredient]()
        for ingredient in data.ingredients {
            let entity = Ingredient(context: context)
            entity.id = Int64(ingredient.id)
            entity.name = ingredient.name
            entity.containsAlcohol = ingredient.containsAlcohol
            entity.image = ingredient.image
            entity.type = ingredient.type
            ingredientMap[ingredient.id] = entity
        }
        
        // Cocktails
        for cocktail in data.cocktails {
            let entity = Cocktail(context: context)
            entity.id = Int64(cocktail.id)
            entity.name = cocktail.name
            entity.image = cocktail.image
            entity.alcoholic = cocktail.alcoholic
            entity.instructions = cocktail.instructions
            
            if let category = categoryMap[cocktail.categoryId] {
                entity.category = category
            }
            
            if let glassType = glassTypeMap[cocktail.glassTypeId] {
                entity.glassType = glassType
            }
            
            for id in cocktail.ingredientIds {
                if let ingredient = ingredientMap[id] {
                    entity.addToIngredients(ingredient)
                }
            }
        }
        
        do {
            try context.save()
            userDefaults.set(true, forKey: "isFirstLoading")
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    private static func loadCocktailsData() -> CocktailData? {
        guard let url = Bundle.main.url(forResource: "cocktails", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode(CocktailData.self, from: data)
        else {
            return nil
        }
        return decoded
    }
}
