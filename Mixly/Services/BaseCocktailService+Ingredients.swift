//
//  BaseCocktailService+Ingredients.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

extension BaseCocktailService {
    
    // Loading filtered by string (name) ingredients
    func loadIngredientsBy(string: String) -> [Ingredient] {
        let request: NSFetchRequest<Ingredient> = Ingredient.fetchRequest()
        
        if !string.isEmpty {
            let predicate = NSPredicate(format: "name CONTAINS[cd] %@", string)
            request.predicate = predicate
        }
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error loading Ingredients by string")
            return []
        }
    }
    
}
