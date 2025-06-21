//
//  BaseCocktailService+Filter.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

extension BaseCocktailService {
    
    // Loading filtered by ingredients cocktails
    func loadFilteredCocktailsBy(ids: [Int]) -> [Cocktail] {
        let request: NSFetchRequest<Cocktail> = Cocktail.fetchRequest()
        
        if !ids.isEmpty {
            let predicate = NSPredicate(format: "SUBQUERY(ingredients, $ingredient, $ingredient.id IN %@).@count == %d", ids, ids.count)
            request.predicate = predicate
        }
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error loading filtered cocktails")
            return []
        }
    }
    
}
