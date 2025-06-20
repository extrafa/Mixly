//
//  BaseCocktailService.swift
//  Mixly
//
//  Created by Ross on 20.06.2025.
//

import Foundation
import CoreData

final class BaseCocktailService: CocktailService {
    
    let context = PersistenceController.shared.context
    
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
    
    func loadCocktailsBy(string: String) -> [Cocktail] {
        let request: NSFetchRequest<Cocktail> = Cocktail.fetchRequest()
        
        if !string.isEmpty {
            let predicate = NSPredicate(format: "name CONTAINS[cd] %@", string)
            request.predicate = predicate
        }
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error loading cocktails by string ")
            return []
        }
    }
    
}
